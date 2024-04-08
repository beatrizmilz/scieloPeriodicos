
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scieloPeriodicos

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Sobre este repositório

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
