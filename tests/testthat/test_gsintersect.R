gnames <- c("LRRN3", "MAL")
data(smoking)
gs <- smoking


test_that("gsintersect takes a gset and a character vector", {
  expect_error(gsintersect(gs, 5))
  expect_error(gsintersect(5, gnames))
  expect_error(gsintersect(gnames, gs))
})

test_that("gsintersect returns the set intersection", {
  testnames <- gs$genesets[[1]]
  newset <- gsintersect(gs, testnames)
  expect_true(setequal(testnames, newset$genesets[[1]]))
  expect_false(setequal(gs$genesets[[2]], newset$genesets[[2]]))

  # keep two genes in both sets
  newset <- gsintersect(gs, gnames)
  expect_equal(length(newset$genesets[[1]]), 2)
  expect_equal(length(newset$genesets[[2]]), 2)
})

test_that("gs_intersect throws warning when the intersect is empty and removes the empty gene set", {
  gs$genesets[[1]] <- c("a", "b", "c")
  expect_warning(gs2 <- gsintersect(gs, gnames))
  expect_equal(length(gs2), 1)
})
# TODO: what happens if intersect is empty set for some of them?
# should remove them, throw warning.