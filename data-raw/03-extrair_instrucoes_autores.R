# Carregar o pacote
devtools::load_all()

# Arquivos existentes
arquivos <- fs::dir_ls(path = "data-raw/dados_html/",
                       recurse = TRUE,
                       glob = "*.html") |>
  tibble::as_tibble() |>
  tidyr::separate(
    value,
    into = c("dir_1", "dir_2", "id_periodico", "mes_ano", "arquivo"),
    sep = "/",
    remove = FALSE
  ) |>
  dplyr::mutate(
    data = stringr::str_extract(arquivo, "[0-9]{4}-[0-9]{2}-[0-9]{2}") |>
      as.Date()
  ) |>
  dplyr::group_by(id_periodico) |>
  dplyr::filter(data == max(data)) |>
  dplyr::ungroup()

# set.seed(1)

possibly_buscar_conteudo_pagina_instrucoes <- purrr::possibly(buscar_conteudo_pagina_instrucoes)


dados_lista <- arquivos$value |>
  purrr::map(possibly_buscar_conteudo_pagina_instrucoes)



# Listar arquivos criados

arquivos_rds <-
  fs::dir_ls(path = "data-raw/dados_instrucoes_autores/",
             glob = "*.rds")


arquivos_lidos <- purrr::map(arquivos_rds, readr::read_rds)

tabela <- purrr::list_rbind(arquivos_lidos)


readr::write_rds(tabela, "data-raw/instrucoes-autores-incompleto.rds")
