criterios_scielo <- tibble::tibble(
  criterio = "sex_gender_issues",
  nome_criterio = "Sex and Gender Issues",
  palavras_chave = list(c("Sex and Gender Issues",
                "Gender and Sex Issues",
                "Sex and genre issues"))
) |>
  tibble::add_row(
  criterio = "preprints",
  nome_criterio = "Preprints",
  palavras_chave = list(c("Preprints", "Preprint",
                "Preprint policy",
                "Acceptance of Preprint"))
  )


usethis::use_data(criterios_scielo, overwrite = TRUE)
