download_html <- function(url, caminho_salvar) {
  url_get <-
    httr::GET(
      url,
      httr::set_cookies(.cookies = c("language" = "pt_BR")),
      httr::write_disk(path = caminho_salvar, overwrite = TRUE),
      httr::config(ssl_verifypeer = FALSE)
    )

  if (url_get$status != 200) {
    usethis::ui_oops("O download do arquivo {caminho_salvar} nao deu certo!")
  } else {
    usethis::ui_done("Download realizado: {caminho_salvar} ")
    caminho_salvar
  }
}
