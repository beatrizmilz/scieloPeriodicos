# pacotes -----------------------------------------------------------------

library(readr)
library(rvest)
library(magrittr)
library(purrr)
library(dplyr)
library(stringr)

# dados originais ---------------------------------------------------------

periodicos_ativos_SciELO <- readr::read_csv("https://raw.githubusercontent.com/beatrizmilz/scieloPeriodicos/main/inst/periodicos_ativos_SciELO.csv")

# cria df base
area_df <- dplyr::tibble(
  area = c("Agricultural Sciences",
            "Applied Social Sciences",
            "Biological Sciences",
            "Engineering",
            "Exact and Earth Sciences",
            "Health Sciences",
            "Human Sciences",
            "Linguistics, Literature and Arts"),
  group_id = as.character(1:8))

# areas tematicas
url <- "https://www.scielo.br/journals/thematic?status=current&filter=areas"

# busca abreviações em ordem
id_periodico <- url %>%
  rvest::read_html() %>%
  rvest::html_nodes(".collectionLink") %>%
  rvest::html_attr("href")

# busca nomes das revistas em ordem
nomes <- url %>%
  rvest::read_html() %>%
  rvest::html_nodes(".journalTitle") %>%
  rvest::html_text()

# df com nomes e id_periodico em ordem
nomes_fix <- dplyr::tibble(
  periodico = nomes,
  id_periodico
) %>%
  dplyr::distinct() %>%
  dplyr::mutate(id_periodico = stringr::str_remove_all(id_periodico, "/j/|/"))

# busca area
resultado <- url %>%
  rvest::read_html() %>%
  rvest::html_table() %>%
  magrittr::extract(c(2:9)) %>%
  purrr::map(~{
    .x %>%
      dplyr::select(2) %>%
      dplyr::mutate(Periódico = stringr::str_extract(Periódico, ".*(?=\\,)"))
  }) %>%
  dplyr::bind_rows(.id = "group_id") %>%
  dplyr::left_join(area_df) %>%
  dplyr::select(
    periodico = Periódico,
    area
  )

# combina area e id_periodico
resultado2 <- resultado %>%
  dplyr::left_join(nomes_fix) %>%
  dplyr::select(id_periodico, area) %>%
  dplyr::arrange(id_periodico, area) %>%
  dplyr::group_by(id_periodico) %>%
  dplyr::summarise(
    area = paste(area, collapse = "; ")
  )

# combina df original com area
periodicos_ativos_SciELO2 <- periodicos_ativos_SciELO %>%
  left_join(resultado2)
