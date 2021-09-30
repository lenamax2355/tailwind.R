test_that("Dependencies allow building commercial SaaS software", {

  # I want to be able to build commercial SaaS software on top of this package
  # using my own copyright, so I want to ensure I avoid any licenses that are
  # incompatible, such as AGPL and its variants.

  options(repos = c(
    tjpalanca = "https://tjpalanca.r-universe.dev",
    CRAN = "https://cran.r-project.org"
  ))

  dependencies <-
    tools::package_dependencies("webtools", recursive = TRUE)[["webtools"]]

  dep_licenses <-
    sapply(
      dependencies,
      function(pkg) {
        read.dcf(system.file("DESCRIPTION", package = pkg), "License")[1, 1]
      }
    )

  names(dep_licenses) <- dependencies

  ok_packages <- c(
    # {loadtest} verified to have an MIT License
    # https://github.com/tmobile/loadtest/blob/master/LICENSE,
    "loadtest",
    # {stringi} has BSD License
    # https://github.com/gagolews/stringi/blob/master/LICENSE
    "stringi"
  )

  ok_licenses <- c(
    # Permissive Licenses
    "BSD_3_clause", "BSD_2_clause", "MIT", "Apache License (== 2.0)",
    "Artistic-2.0",
    # Weak Copyleft with linking
    "LGPL (>= 2.1)",
    # Copyleft but can be run on a server
    "GPL-2", "GPL-2 | GPL-3", "GPL-3", "GPL (>= 2)", "GPL",
    # Part of R which is GPL-2
    "Part of R 4.1.1"
  )

  ok_licenses <- c(
    ok_licenses,
    paste0(ok_licenses, " + file LICENSE"),
    paste0(ok_licenses, " | file LICENSE")
  )

  not_ok_licenses <-
    dep_licenses[
      !(dep_licenses %in% ok_licenses | names(dep_licenses) %in% ok_packages)
    ]

  expect_length(not_ok_licenses, 0)

})
