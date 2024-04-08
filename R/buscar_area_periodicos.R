buscar_area_periodicos <- function() {
  # areas tematicas
  url <-
    "https://www.scielo.br/journals/thematic?status=current&filter=areas"

  # acessando HTML ------------------------------
  html_areas <- url |>
    rvest::read_html()

  # Criando uma tabela com as abreviações e nome dos periódicos---
  # busca abreviações em ordem
  id_periodico <- html_areas |>
    rvest::html_nodes(".collectionLink") |>
    rvest::html_attr("href")

  # busca nomes das revistas em ordem
  nomes <- html_areas |>
    rvest::html_nodes(".journalTitle") |>
    rvest::html_text()

  # df com nomes e id_periodico em ordem
  nomes_fix <- dplyr::tibble(periodico = nomes,
                             id_periodico) |>
    dplyr::distinct() |>
    dplyr::mutate(id_periodico = stringr::str_remove_all(id_periodico, "/j/|/"))


  # Buscando as áreas no HTML -----------------
  area <- html_areas |>
    rvest::html_nodes(".panel-title") |>
    rvest::html_text() |>
    stringr::str_squish()

  # cria df base
  area_df <- dplyr::tibble(area = area,
                           group_id = as.character(1:8))

  tab_periodico_area <- html_areas |>
    rvest::html_table() |>
    # removendo o primeiro elemento
    magrittr::extract(-1) |>
    purrr::map( ~ {
      .x |>
        dplyr::select(2) |>
        dplyr::mutate(Periódico = stringr::str_extract(Periódico, ".*(?=\\,)"))
    })  |>
    purrr::set_names(1:nrow(area_df)) |>
    purrr::list_rbind(names_to = "group_id") |>
    dplyr::left_join(area_df, by = "group_id") |>
    dplyr::select(periodico = Periódico,
                  area)

  # combina area e id_periodico
  tab_id_periodico_area <- tab_periodico_area |>
    dplyr::left_join(nomes_fix, by = "periodico") |>
    dplyr::select(id_periodico, area) |>
    dplyr::arrange(id_periodico, area) |>
    dplyr::group_by(id_periodico) %>%
    dplyr::summarise(area = paste(area, collapse = "; "))

  tab_id_periodico_area


}
