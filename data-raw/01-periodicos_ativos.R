# Carregar o pacote
devtools::load_all()

# Listar periódicos ativos ----------------------------------
periodicos_ativos <- listar_periodicos_ativos()


# Buscar área dos periódicos ------------------------------

periodicos_ativos_area <- buscar_area_periodicos()

usethis::use_data(periodicos_ativos_area, overwrite = TRUE)

# Unir área dos periódicos -----------------------------------

periodicos_ativos_completo <- dplyr::left_join(periodicos_ativos,
                                               periodicos_ativos_area,
                                               by = "id_periodico") |>
  dplyr::relocate(area, .after = nome)


# Salvando no repositório em um arquivo CSV ------------------
readr::write_csv(periodicos_ativos_completo,
                 file = "inst/periodicos_ativos_SciELO.csv",
                 quote = "needed")

usethis::ui_info("Dados CSV salvos!")
