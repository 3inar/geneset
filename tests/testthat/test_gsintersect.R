gnames <- c("LRRN3", "MAL")
data(smoking)
gs <- smoking

test_that("gsintersect takes a list and a character vector", {
  expect_error(gsintersect(gs, 5))
  expect_error(gsintersect(5, gnames))
  expect_error(gsintersect(gnames, gs))
})

test_that("gsintersect returns the set intersection", {
  newlist <- gsintersect(gs, gs[[1]])
  expect_true(setequal(gs[[1]], newlist[[1]]))
  expect_false(setequal(gs[[2]], newlist[[2]]))

  # keep two genes in both sets
  newlist <- gsintersect(gs, gnames)
  expect_equal(length(newlist[[1]]), 2)
  expect_equal(length(newlist[[2]]), 2)
})

test_that("gsintersect preserves names in gene list", {
  newlist <- gsintersect(gs, gnames)
  expect_equal(names(gs), names(newlist))
})