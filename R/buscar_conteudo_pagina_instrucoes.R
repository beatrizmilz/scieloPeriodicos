buscar_conteudo_pagina_instrucoes <- function(caminho_arquivo,
                                              salvar_localmente = TRUE) {

  id_periodico <- stringr::str_extract(caminho_arquivo, "about_.*.html") |>
    stringr::str_remove_all("about_|.html")

  data_obtencao_informacao <- stringr::str_extract(caminho_arquivo, "[0-9]{4}-[0-9]{2}-[0-9]{2}")

    data_atualizacao_pagina <- rvest::read_html(caminho_arquivo) |>
    rvest::html_element("body") |>
    rvest::html_element(".page-updated-at") |>
    rvest::html_text() |>
    stringr::str_trim() |>
    stringr::str_extract("[0-9]{2}/[0-9]{2}/[0-9]{4}")

  html_lista <- rvest::read_html(caminho_arquivo) |>
    rvest::html_element("body")  |>
    rvest::html_elements(".col-sm-12")

  tabelas_com_texto <- html_lista |>
    rvest::html_elements(xpath = "./table")

   titulo_secao <- tabelas_com_texto |>
     purrr::map(~rvest::html_elements(.x, xpath = "./preceding-sibling::*[local-name() = 'h1' or local-name() = 'h2'][1]")) |>
     purrr::map(rvest::html_text) |>
     purrr::map(~ifelse(length(.x) == 0, "", .x)) |>
     purrr::list_c() |>
     stringr::str_squish()


   subtitulo_secao <- tabelas_com_texto |>
     purrr::map( ~ rvest::html_elements(.x, xpath = "./preceding-sibling::p[1]")) |>
     purrr::map(rvest::html_text) |>
     purrr::map(~ifelse(length(.x) == 0, "", .x)) |>
     purrr::list_c() |>
     stringr::str_squish()

  texto_secao <- tabelas_com_texto |>
    rvest::html_element("tbody") |>
    rvest::html_text() |>
    stringr::str_remove_all("\t|\r") |>
    stringr::str_trim()


  tabela_conteudo <- tibble::tibble(
    titulo_secao,
    subtitulo_secao,
    texto_secao
  ) |>
    dplyr::mutate(
      id_periodico = id_periodico,
      .before = tidyselect::everything(),
    ) |>
    dplyr::mutate(data_obtencao_informacao = data_obtencao_informacao,
                  data_atualizacao_pagina = data_atualizacao_pagina)


    if(isTRUE(salvar_localmente)){
      caminho <- glue::glue("data-raw/dados_instrucoes_autores/{id_periodico}.rds")
      tabela_conteudo |>
        readr::write_rds(file = caminho)
    }

  tabela_conteudo

}
