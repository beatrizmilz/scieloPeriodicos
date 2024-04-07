baixar_pagina_instrucoes <- function(dados_periodico) {
  # Mes e ano, para organizar em pastas
  mes_ano <- Sys.Date() |>
    as.character() |>
    stringr::str_sub(1, 7)

  # Compondo o diretorio para salvar os arquivos
  dir_salvar <-
    paste0("data-raw/dados_html/",
           dados_periodico$id_periodico,
           "/",
           mes_ano)

  # Compondo o nome do arquivo
  nome_arquivo <-
    paste0(Sys.Date(),
           "_about_",
           dados_periodico$id_periodico,
           ".html")

  # Criar a pasta, caso nao exista
  fs::dir_create(dir_salvar)

  # Criando caminho completo
  caminho_completo <- paste0(dir_salvar,
                             "/",
                             nome_arquivo)

  if (fs::file_exists(caminho_completo)) {
    usethis::ui_info("Arquivo baixado anteriormente: {caminho_completo}")
  } else {
    # Fazer download do arquivo HTML
    arquivo_html <-
      download_html(url = dados_periodico$url_instrucoes,
                    caminho_salvar = caminho_completo)
  }

  caminho_completo

}
