# Carregar o pacote
devtools::load_all()
Sys.setenv(LANG = "pt_BR.UTF-8")


periodicos_ativos <- readr::read_csv("inst/periodicos_ativos_SciELO.csv")


# Baixar arquivo HTML da página de instruções aos autores -----

periodicos_ativos |>
  # dplyr::filter(id_periodico == "asoc") |>
  dplyr::group_split(id_periodico) |>
  purrr::walk(baixar_pagina_instrucoes, .progress = TRUE)

usethis::ui_info("Download das páginas de instruções aos autores completo!")

