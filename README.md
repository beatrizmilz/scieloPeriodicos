
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

- Desenvolvido por: [Beatriz Milz](https://github.com/beatrizmilz)
  (Secretaria Executiva - [Ambiente &
  Sociedade](https://www.scielo.br/asoc))

## Dados disponíveis

### Periódicos ativos

- O arquivo
  [`inst/periodicos_ativos_SciELO.csv`](https://github.com/beatrizmilz/scieloPeriodicos/blob/main/inst/periodicos_ativos_SciELO.csv)
  apresenta dados sobre os periódicos ativos na [Coleção
  SciELO](https://www.scielo.br/journals/alpha?status=current).

- Cada linha representa um periódico.

- As colunas presentes são:

  - `id_periodico`:
  - `titulo_periodico`
  - `quantidade_volumes`
  - `edicao_mais_recente`
  - `url_submissao`
  - `url_instrucoes`
  - `data_obtencao_informacao`

Exemplo dos dados disponíveis:

| id_periodico | titulo_periodico     | quantidade_volumes | edicao_mais_recente | url_submissao                                   | url_instrucoes                              | data_obtencao_informacao |
|:-------------|:---------------------|:-------------------|:--------------------|:------------------------------------------------|:--------------------------------------------|:-------------------------|
| asoc         | Ambiente & Sociedade | 53 números         | 2023, Volume: 26    | <http://mc04.manuscriptcentral.com/asoc-scielo> | <https://www.scielo.br/journal/asoc/about/> | 2024-04-07               |

Informações úteis:

- Existem 318 periódicos na [lista de periódicos ativos na página da
  SciELO](https://www.scielo.br/journals/alpha?status=current).

## ROADMAP

- [x] Criar uma função para baixar a lista de periódicos ativos.

- [x] Criar um fluxo de trabalho com GitHub Actions para atualizar e
  salvar a lista de periódicos ativos com certa frequência.

- [x] Estruturar a lógica para baixar as páginas de instruções dos
  periódicos.

- [ ] Criar um fluxo de trabalho com GitHub Actions para salvar a página
  de instruções aos autores de cada periódico.

- [ ] Adicionar na tabela
  [`periodicos_ativos_SciELO.csv`](https://github.com/beatrizmilz/scieloPeriodicos/blob/main/inst/periodicos_ativos_SciELO.csv)
  informações sobre as [áreas de
  conhecimento](https://www.scielo.br/journals/thematic?status=current&filter=areas).

- [ ] Analisar: Quais são plataformas os periódicos utilizam para
  submissão de manuscritos (além do ScholarOne)? Quantos periódicos
  utilizam cada plataforma?

## Licença

- [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/):
  *Attribution — You must give appropriate credit, provide a link to the
  license, and indicate if changes were made*.
