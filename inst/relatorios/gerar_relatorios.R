devtools::load_all()

criterios <- criterios_scielo$criterio

arquivos <- criterios |>
  purrr::walk(
    ~ quarto::quarto_render(
    input = here::here("inst", "relatorios", "template_aderencia_criterios.qmd"),
    execute_params = list(criterio = .x),
    output_file = paste0(.x, ".html")
  ), .progress = TRUE)

paste0(arquivos, ".html") |>
fs::file_move("docs/")



fs::dir_copy(path = "inst/relatorios/template_aderencia_criterios_files/",
             new_path = "docs/", overwrite = TRUE)

# Index ----------

paste0("inst/relatorios/index.html") |>
fs::file_move("docs/")


paste0("inst/relatorios/index_files") |>
fs::dir_copy("docs/", overwrite = TRUE)

