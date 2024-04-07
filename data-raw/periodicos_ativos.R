# Carregar o pacote
devtools::load_all()

# Listar periódicos ativos ----------------------------------
periodicos_ativos <- listar_periodicos_ativos()

# Salvando no repositório em um arquivo CSV
readr::write_csv(periodicos_ativos,
                 file = "inst/periodicos_ativos_SciELO.csv",
                 quote = "needed")

usethis::ui_info("Dados CSV salvos!")

