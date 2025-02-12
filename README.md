This repo helps team members that are not the official maintainer / CRAN contact for a specific package to stay in the loop about failed CRAN checks, and potential archival deadlines.

Two methods are available to track the status of a package on CRAN:

- the summary dashboard at https://epiverse-trace.github.io/etdashboard
  This dashboard is updated weekly and provides a summary of the status of all packages in the `epiverse-trace` r-universe available on CRAN.
  If a package is at risk of archival, the deadline for fixing & resubmitting is displayed in the "Deadline" column.

- each package from the `epiverse-trace` r-universe available on CRAN has a dedicated issue in this repository: https://github.com/epiverse-trace/etdashboard/issues?q=is%3Aissue
  The issue is re-opened every time the package is at risk of archival.
  To receive notifications about the status of a package, you can subscribe to the issue.

