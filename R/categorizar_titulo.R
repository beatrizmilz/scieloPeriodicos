categorizar_titulo_secao <- function(titulo_secao) {
  dplyr::case_when(
    stringr::str_to_lower(titulo_secao)  %in% c(
      "about the journal",
      "about us",
      "informações básicas",
      "sobre o periódico"
    ) ~ "About the journal",

    stringr::str_to_lower(titulo_secao)  %in% c(
      "instructions to authors",
      "instructions for authors",
      "author guidelines",
      "authors’ guidelines",
      "instruções aos autores2",
      "intructions to the authors",
      "guide for authors",
      "guidelines to authors",
      "instrucciones a los autores",
      "instruções aos autores",
      "editorial policy",
      "editorial policies",
      "editorial policy and instructions for authors",
      "subscriptions"
    ) ~ "Instructions to authors",

    stringr::str_to_lower(titulo_secao)  %in% c(
      "editorial board",
      "editorial team",
      "editorial committee",
      "cuerpo editorial",
      "corpo editorial",
      "corpo editorial2",
      "editorial body",
      "editorial staff",
      "reviewers"
    ) ~ "Editorial Board"
  )
}
