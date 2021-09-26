test_that("Tailwind CSS utilities work", {

  unlink(tailwind_dir(), recursive = TRUE)
  expect_false(tailwind_installed())
  expect_error(tailwind_install(), NA)
  expect_true(tailwind_installed())

})
