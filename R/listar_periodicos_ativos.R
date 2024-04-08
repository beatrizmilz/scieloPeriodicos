listar_periodicos_ativos <- function() {
  url_pagina <- "https://www.scielo.br/journals/alpha?status=current"

  periodicos_get <- httr::GET(url_pagina)


  periodicos_content <- httr::content(periodicos_get)

  tr_elements <- periodicos_content |>
    rvest::html_element("body") |>
    rvest::html_elements("section") |>
    rvest::html_elements("tr")

  # TD - texto ---------------------------------------------
  lista_td_texto <- tr_elements |>
    purrr::map(~ rvest::html_elements(.x, "td")) |>
    purrr::map(~ rvest::html_elements(.x, "a")) |>
    purrr::compact()

  # título do periódico
  journal_title <- lista_td_texto |>
    purrr::map( ~  rvest::html_nodes(.x, ".journalTitle")) |>
    purrr::map(rvest::html_text) |>
    tibble::enframe() |>
    dplyr::mutate(nome = as.character(value)) |>
    dplyr::select(-value)

  # Número de issues do periódico
  journal_issues <- lista_td_texto |>
    purrr::map(~  rvest::html_nodes(.x, ".journalIssues")) |>
    purrr::map(rvest::html_text) |>
    tibble::enframe() |>
    dplyr::mutate(quantidade_volumes = as.character(value)) |>
    dplyr::select(-value)

  # Last issue - volume mais recente
  last_issue_legend <- lista_td_texto |>
    purrr::map(~  rvest::html_nodes(.x, ".last-issue-legend")) |>
    purrr::map(rvest::html_text) |>
    tibble::enframe() |>
    dplyr::mutate(edicao_mais_recente = as.character(value)) |>
    dplyr::select(-value)



  informacoes_periodico <-
    dplyr::left_join(journal_title, journal_issues, by = "name") |>
    dplyr::left_join(last_issue_legend, by = "name") |>
    dplyr::rename(rowid = name)



  # URLs que estão nos botões --------------------------------------

  col_nomes <- tibble::tibble(
    nome_colunas = c(
      "homepage",
      "submission",
      "about_editors",
      "about_instructions",
      "about",
      "about_contact"
    )
  )

  lista_tibble <- tr_elements |>
    purrr::map(~ rvest::html_nodes(.x, ".actions")) |>
    purrr::map(~ rvest::html_elements(.x, "a")) |>
    purrr::map(~ rvest::html_attr(.x, "href")) |>
    purrr::compact() |>
    purrr::map(tibble::as_tibble) |>
    purrr::map(dplyr::bind_cols, col_nomes) |>
    purrr::map( ~ tidyr::pivot_wider(.x, names_from = "nome_colunas",
                                     values_from = "value")) |>
    purrr::list_rbind()

  prefixo_scielo <- "https://www.scielo.br"

  df_urls <- lista_tibble |>
    dplyr::transmute(
      id_periodico  = stringr::str_remove(homepage, "/j/") |>
        stringr::str_remove("/$"),
      url_submissao = submission,
      url_instrucoes = paste0(prefixo_scielo, about)
    ) |>
    tibble::rowid_to_column()

  # Unir tabelas ----------------------------------
  tabela_completa <-
    dplyr::left_join(informacoes_periodico,  df_urls, by = "rowid") |>
    dplyr::mutate(data_obtencao_informacao = Sys.Date()) |>
    dplyr::relocate(id_periodico, .before = tidyselect::everything()) |>
    dplyr::arrange(id_periodico) |>
    dplyr::select(-rowid)

  tabela_completa
}
