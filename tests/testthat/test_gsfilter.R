data(smoking)
gs <- smoking

test_that("gsfilter takes two numbers, min and max", {
  gsfilter(gs)
  expect_error(gsfilter(gs, max="5"))
  expect_error(gsfilter(gs, min="5"))
})

test_that("gsfilter removes gene sets outside size range", {
  expect_lt(length(gsfilter(gs, max=24)), length(gs))
  gs$genesets[[1]] <- c("a", "b", "c")
  expect_lt(length(gsfilter(gs, min=4)), length(gs))
  expect_lt(length(gsfilter(gs)), length(gs))
  expect_equal(length(gsfilter(gs, min=3)), length(gs))

  gs <- smoking
  expect_equal(length(gsfilter(gs)), length(gs))
})

test_that("gsfilter only accepts gset objects", {
  brokenset <- smoking
  class(brokenset) <- "list"
  expect_error(gsfilter(brokenset))
})