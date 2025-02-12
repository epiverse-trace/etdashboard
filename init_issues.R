# Script to open the issues that will be reopened by the check-deadlines
# workflow
et_cran_pkgs <- "https://epiverse-trace.r-universe.dev/api/packages/" |>
  jsonlite::fromJSON() |>
  dplyr::filter(
    `_registered`,
    `_cranurl`
  ) |>
  dplyr::pull(Package)

existing_pkg_issues <- gh::gh(
  "/repos/{owner}/{repo}/issues",
  owner = "epiverse-trace",
  repo = "etdashboard",
  state = "all"
) |>
  purrr::map_chr("title")

pkg_issues_to_open <- setdiff(et_cran_pkgs, existing_pkg_issues)

for (pkg in pkg_issues_to_open) {
  opened_issue <- gh::gh(
    "POST /repos/{owner}/{repo}/issues",
    owner = "epiverse-trace",
    repo = "etdashboard",
    title = pkg,
    body = glue::glue(
      "This issue tracks CRAN deadlines and archival risk for the {pkg} package.",
      "\n\n",
      "It will be automatically reopened each time CRAN identifies check ",
      "failures that threaten the package continued existence on CRAN.\n\n",
      "If you are interested in getting informed of this package's status ",
      "(e.g., if you're a co-maintainer or co-author), ",
      "feel free to subscribe to this issue."
    )
  )
  gh::gh(
    "PATCH /repos/{owner}/{repo}/issues/{issue_number}",
    owner = "epiverse-trace",
    repo = "etdashboard",
    state = "closed",
    issue_number = opened_issue$number
  )
}
