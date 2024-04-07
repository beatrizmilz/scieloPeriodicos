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


dados_lista <- arquivos$value|>
  purrr::map(buscar_conteudo_pagina_instrucoes)



# Listar arquivos criados

arquivos_rds <-
  fs::dir_ls(path = "data-raw/dados_instrucoes_autores/",
             glob = "*.rds")


arquivos_lidos <- purrr::map(arquivos_rds, readr::read_rds)

tabela <- purrr::list_rbind(arquivos_lidos)

tabela_arrumada <- tabela |>
  dplyr::mutate(
    titulo_secao_padronizado = categorizar_titulo_secao(titulo_secao),
    .after = titulo_secao
  )



readr::write_rds(tabela_arrumada, "inst/instrucoes-autores.rds")



# writexl::write_xlsx(tabela_arrumada, "data-raw/instrucoes-autores-incompleto.xlsx")
