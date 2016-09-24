gset <- load_gmt("testgmt.gmt")

test_that("load_gmt loads testgmt.gmt as expected", {
  gsnames <- c("set1", "set2", "name w space")
  gsdesc <- c("description 1", "description 2", "description3")
  gsets <- list(c("a", "b", "c"), c("d", "e", "f"), c("a", "b", "c", "d", "e", "f", "g"))

  expect_identical(gset$names, gsnames)
  expect_identical(gset$descriptions, gsdesc)
  expect_identical(gset$genesets, gsets)
})

test_that("load_gmt returns gset object", {
  expect_is(gset, "gset")
})