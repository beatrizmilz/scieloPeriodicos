# O vetor abaixo foi criado manualmente,
# a partir da observação dos valores.
# Isso deve ser incrementado com o tempo

criterios_scielo <- tibble::tibble(
  criterio = "sex_gender_issues",
  nome_criterio_en = "Sex and Gender Issues",
  nome_criterio = "Questões de Sexo e Gênero",
  palavras_chave = list(c("Sex and Gender Issues",
                "Gender and Sex Issues",
                "Sex and genre issues",
                "Questões de Sexo e Gênero"))
) |>
  tibble::add_row(
  criterio = "preprints",
  nome_criterio = "Preprints",
  nome_criterio_en = "Preprints",
  palavras_chave = list(c("Preprints", "Preprint",
                "Preprint policy",
                "Acceptance of Preprint",
                "Aceitação de Preprint"))
  )


usethis::use_data(criterios_scielo, overwrite = TRUE)
