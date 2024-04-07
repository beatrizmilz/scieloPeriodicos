# O vetor abaixo foi criado manualmente,
# a partir da observação dos valores.
# Isso deve ser incrementado com o tempo

criterios_scielo <- tibble::tibble(
  criterio = "sex_gender_issues",
  nome_criterio_en = "Sex and Gender Issues",
  nome_criterio = "Questões de Sexo e Gênero",
  palavras_chave = list(
    c(
      "Sex and Gender Issues",
      "Gender and Sex Issues",
      "Sex and genre issues",
      "Questões de Sexo e Gênero"
    )
  )
) |>
  tibble::add_row(
    criterio = "preprints",
    nome_criterio = "Preprints",
    nome_criterio_en = "Preprints",
    palavras_chave = list(
      c(
        "Preprints",
        "Preprint",
        "Preprint policy",
        "Acceptance of Preprint",
        "Aceitação de Preprint"
      )
    )
  ) |>
  tibble::add_row(
    criterio = "open_science",
    nome_criterio = "Conformidade com a Ciência Aberta",
    palavras_chave = list(
      c(
        "Conformidade com a Ciência Aberta",
        "Ciência aberta",
        "Open Science",
        "Formulário de Conformidade com a Ciência Aberta",
        "Boas Práticas de Ciência Aberta",
        "Incentivo à Ciência Aberta"
      )
    )
  ) |>
  tibble::add_row(
    criterio = "ethics",
    nome_criterio = "Ética",
    palavras_chave = list(
      c(
        "Ética e integridade",
        "Ética",
        "Ético",
        "Recomendações Éticas",
        "Considerações Éticas e Integridade em Pesquisa",
        "Ética na pesquisa com seres humanos e animais",
        "Código de Ética",
        "COMISSÃO DE ÉTICA",
        "Comitê de ética",
        "Conduta Ética",
        "Considerações éticas",
        "Considerações Éticas e Integridade em Pesquisa",
        "Considerações Éticas e Legais",
        "Consultoria de ética em pesquisa",
        "Declaração de ética",
        "Declaração de ética e boas práticas",
        "Declaração de ética e de boas práticas de publicação",
        "Declaração de publicação ética e prática indevidas",
        "Declaração sobre ética e práticas inadequadas",
        "Diretrizes éticas",
        "Diretrizes sobre boas práticas éticas",
        "Recomendações Éticas",
        "Pesquisa em Seres Humanos e Experimentais"
      )
    )
  )


usethis::use_data(criterios_scielo, overwrite = TRUE)
