regex_about_this_journal <- c(
  "About this journal",
  "Brief historic of the journal",
  "Indexing",
  "Intellectual Property",
  "Intelectual Property",
  "Support",
  "Informações básicas",
  "Serviços de indexação",
  "Propriedade intelectual",
  "Patrocinador",
  "Divulgação",
  "Serviços de informação",
  "Basic Information",
  "Indexed in",
  "Sponsors",
  "Sources of indexation",
  "Objectives and Scope",
  "Sponsor",
  "Contact",
  "Best Practices of Open Science",
  "Information services",
  "Indexation"

) |>  unique() |>
  paste0(collapse = "|") |>
  stringr::str_to_lower()


regex_editorial_board <- c(
  "Editor in Chief",
  "Scientific-Editorial Committee",
  "Deputy Editors",
  "Associate Editors",
  "Editorial Board",
  "Assistant Editors",
  "Editorial secretary",
  "Editor",
  "Advisory Committee",
  "Layout",
  "Scientific Board",
  "Technical Support - Composition",
  "Committee writing",
  "Publishing production",
  "Administrative Board",
  "Comunication Assistant and Portuguese Editing"

) |>
  unique() |>
  paste0(collapse = "|") |>
  stringr::str_to_lower()

regex_instructions <-
  c(
    "General guidelines",
    "Focus and scope",
    "System of submission",
    "Manuscript Submission Instructions",
    "Assessment of Manuscripts",
    "Ethical Recommendations",
    "Submission Requirements",
    "File preparation",
    "Copyright",
    "Scope and editorial policy",
    "Manuscript evaluation",
    "Publication Ethics and Malpractice Statement",
    "Open Access Policy",
    "Form and preparation of manuscripts",
    "Submission of the manuscripts",
    "Manuscript preparation",
    "Policies of open access, authors’ rights and self-archiving",
    "Scope of this journal",
    "Submission of Manuscripts",
    "Types of papers",
    "Manuscript processing",
    "Send of the manuscripts",
    "Scope and Policy",
    "Scope",
    "About peer review",
    "Sending of manuscripts",
    "Manuscript assessment process",
    "Manuscript submission",
    "Documents",
    "Instructions to authors",
    "Form and  preparation of  manuscripts",
    "Plagiarism and Editorial Misconduct",
    "Submission checklist",
    "Submitting a manuscript",
    "Format and preparation of manuscripts",
    "Instructions for Authors",
    "Articles Submission",
    "Instructions for Authors",
    "Presentation of originals"

  ) |>  unique() |>
  paste0(collapse = "|")  |>
  stringr::str_to_lower()

categorizar_titulo <- function(x) {
  lower_x <- stringr::str_to_lower(x)

  dplyr::case_when(
    stringr::str_detect(lower_x, regex_about_this_journal) ~ "About the journal",
    stringr::str_detect(lower_x, regex_editorial_board) ~ "Editorial Board",
    stringr::str_detect(lower_x, regex_instructions) ~ "Instructions to authors"
  )
}
