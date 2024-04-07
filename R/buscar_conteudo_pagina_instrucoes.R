buscar_conteudo_pagina_instrucoes <- function(caminho_arquivo,
                                              salvar_localmente = TRUE) {

  id_periodico <- stringr::str_extract(caminho_arquivo, "about_.*.html") |>
    stringr::str_remove_all("about_|.html")

  data_obtencao_informacao <- stringr::str_extract(caminho_arquivo, "[0-9]{4}-[0-9]{2}-[0-9]{2}")

  html_lista <- rvest::read_html(caminho_arquivo) |>
    rvest::html_element("body")  |>
    rvest::html_elements(".col-sm-12")

  tabelas_com_texto <- html_lista |>
    rvest::html_elements("table")

  # Nem sempre funciona, em alguns casos ele
  subtitulo_secao <- tabelas_com_texto |>
    rvest::html_elements(xpath = "./preceding-sibling::p[1]/*") |>
    rvest::html_text()

  texto_secao <- tabelas_com_texto |>
    rvest::html_element("tbody") |>
    rvest::html_text() |>
    stringr::str_remove_all("\t|\r") |>
    stringr::str_trim()


  # Verificar se os tamanhos são iguais:
  if(length(subtitulo_secao) != length(texto_secao)){
    # browser()
    usethis::ui_oops("Listas com tamanhos diferentes, averiguar.")
  }

  tabela_conteudo <- tibble::tibble(
    subtitulo_secao,
    texto_secao
  ) |>
    dplyr::mutate(
      id_periodico = id_periodico,
      titulo_secao_gerado = categorizar_titulo(subtitulo_secao),
      .before = tidyselect::everything(),
    ) |>
    dplyr::mutate(data_obtencao_informacao = data_obtencao_informacao)


    if(isTRUE(salvar_localmente)){
      caminho <- glue::glue("data-raw/dados_instrucoes_autores/{id_periodico}.rds")
      tabela_conteudo |>
        readr::write_rds(file = caminho)
    }

  tabela_conteudo

}
