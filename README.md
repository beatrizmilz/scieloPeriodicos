
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scieloPeriodicos

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Sobre este repositório

- **Este repositório está em desenvolvimento, e aceitamos sugestões e
  contribuições**.

- Esse repositório apresenta rotinas para obter a lista atualizada de
  periódicos que fazem parte da [Coleção
  SciELO](https://www.scielo.br/journals/alpha?status=current).

- A lista de periódicos ativos está disponível neste repositório, em:
  [`inst/periodicos_ativos_SciELO.csv`](https://github.com/beatrizmilz/scieloPeriodicos/blob/main/inst/periodicos_ativos_SciELO.csv).

- Os dados são obtidos utilizando uma técnica chamada raspagem de dados
  (ou *web scraping*), utilizando a linguagem R.

## Dados disponíveis

### Periódicos ativos

- O arquivo
  [`inst/periodicos_ativos_SciELO.csv`](https://github.com/beatrizmilz/scieloPeriodicos/blob/main/inst/periodicos_ativos_SciELO.csv)
  apresenta dados sobre os periódicos ativos na [Coleção
  SciELO](https://www.scielo.br/journals/alpha?status=current).

- Cada linha representa um periódico.

- As colunas presentes são:

  - `id_periodico`:
  - `nome`
  - `area`
  - `quantidade_volumes`
  - `edicao_mais_recente`
  - `url_submissao`
  - `url_instrucoes`
  - `data_obtencao_informacao`

Exemplo dos dados disponíveis:

| id_periodico | nome                 | area                                                              | quantidade_volumes | edicao_mais_recente | url_submissao                                   | url_instrucoes                              | data_obtencao_informacao |
|:-------------|:---------------------|:------------------------------------------------------------------|:-------------------|:--------------------|:------------------------------------------------|:--------------------------------------------|:-------------------------|
| asoc         | Ambiente & Sociedade | Ciências Biológicas; Ciências Humanas; Ciências Sociais Aplicadas | 53 números         | 2023, Volume: 26    | <http://mc04.manuscriptcentral.com/asoc-scielo> | <https://www.scielo.br/journal/asoc/about/> | 2024-04-08               |

Informações úteis:

- Existem 318 periódicos na [lista de periódicos ativos na página da
  SciELO](https://www.scielo.br/journals/alpha?status=current).

### Informações sobre cada periódico

O arquivo
[`inst/instrucoes-autores.rds`](https://github.com/beatrizmilz/scieloPeriodicos/blob/main/inst/instrucoes-autores.rds)
apresenta dados extraídos das páginas dos periódicos, que apresentam
informações sobre os seguintes tópicos: **Sobre o periódico**, **Corpo
Editorial** e **Instruções aos autores**.

O arquivo tem a extensão `.rds`, que é possível ser aberto utilizando o
R. Estamos avaliando outros formatos que possibilitem o
compartilhamento. Como alguns campos apresentam grandes textos, isso
dificulta a exportação do arquivo em um `.csv` ou `.xlsx`.

O objetivo de obter essas informações é ter acesso às políticas
editoriais dos periódicos da coleção, principalmente se tratando dos
“[Critérios SciELO Brasil: critérios, políticas e procedimentos para a
admissão e a permanência de periódicos científicos na Coleção SciELO
Brasil](https://www.scielo.br/about/criterios-scielo-brasil)”.

Uma versão preliminar da exploração destes dados pode ser acessada neste
link: <https://beatrizmilz.github.io/scieloPeriodicos/>

``` r
informacoes_periodicos <- readr::read_rds("inst/instrucoes-autores.rds")
```

Podemos buscar em todos os periódicos da coleção as seções e seus textos
relacionados à algum tema.

Por exemplo, segue abaixo a política editorial da [Revista Brasileira de
Saúde Materno Infantil](https://www.scielo.br/journal/rbsmi/about/)
sobre o tema **Questões de Sexo e Gênero**:

``` r
informacoes_periodicos |> 
  dplyr::filter(subtitulo_secao == "Questões de Sexo e Gênero", id_periodico == "rbsmi") |>
  dplyr::select(texto_secao) |> 
  knitr::kable(col.names = "RBSMI - Questões de Sexo e Gênero")
```

| RBSMI - Questões de Sexo e Gênero                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A equipe editorial da Revista Brasileira de Saúde Materno Infantil, além dos autores que publicam na revista, devem sempre observar as diretrizes sobre Equidade de Sexo e Gênero em Pesquisa (Sex and Gender Equity in Research – SAGER). As diretrizes SAGER compreendem um conjunto de diretrizes que orientam o relato de informações sobre sexo e gênero no desenho do estudo, na análise de dados e nos resultados e interpretação dos achados. Além disso, a RBSMI observa a política de equidade de gênero na formação de seu corpo editorial. |

## Sugestões

- Caso tenha sugestões/ideias, [escreva uma
  issue](https://github.com/beatrizmilz/scieloPeriodicos/issues/new).

## Autoria

- Desenvolvido por:

  - Dra. [Beatriz Milz](https://github.com/beatrizmilz) (Secretaria
    Executiva - [Ambiente & Sociedade](https://www.scielo.br/asoc))

  - Dr. [Julio Trecenti](https://github.com/jtrecenti) - Pesquisador
    pós-doc em Jurimetria - UNIFESP Osasco

  - Ms. [Bruno Mioto](https://github.com/brunomioto) - Doutorando em
    Ecologia de Ambientes Aquáticos Continentais
    ([PEA-UEM](https://www.pea.uem.br/)).

## Licença

- [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/):
  *Attribution — You must give appropriate credit, provide a link to the
  license, and indicate if changes were made*.
