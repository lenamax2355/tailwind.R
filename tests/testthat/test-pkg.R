test_that("package name is correct", {

  expect_equal("webtools", pkg_name)

})

test_that("package metadata", {

  expect_string(pkg_vers())

})

test_that("package directories", {

  expect_class(pkg_inst(), "fs_path")
  expect_class(pkg_temp(), "fs_path")
  expect_class(pkg_user(), "fs_path")

})
