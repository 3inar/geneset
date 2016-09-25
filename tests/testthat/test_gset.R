n <- c("n1", "n2")
d <- c("d1", "d2")
g <- list(c("g1", "g2", "g3"), c("g2", "g4"))
two_numbers <- c(1, 2)
gs <- gset(n,d,g)

test_that("gset() makes the right thing", {
  expect_identical(gs$names, n)
  expect_identical(gs$descriptions, d)
  expect_identical(gs$genesets, g)

  expect_is(gs, "gset")
})

test_that("gset checks argument types", {
  expect_error(gset(n,d, two_numbers))
  expect_error(gset(n,two_numbers, g))
  expect_error(gset(two_numbers, d, g))
})

test_that("gset checks argument lengths", {
  short_char <- c("5")
  long_char <- c("4", "5", "6")
  long_list <- c(g, list("g9"))

  expect_error(gset(n, short_char, g))
  expect_error(gset(long_char, d, g))
  expect_error(gset(long_char, d, long_list))
  expect_error(gset(n, d, long_list))
  expect_error(gset(n, d, g[1]))
})

test_that("subsetting gset makes sense", {
  g_one <- gs[1]
  g_two <- gs[2]

  expect_identical(g_one$names, n[1])
  expect_identical(g_one$descriptions, d[1])
  expect_identical(g_one$genesets, g[1])

  expect_identical(g_two$names, n[2])
  expect_identical(g_two$descriptions, d[2])
  expect_identical(g_two$genesets, g[2])

  g_one <- gs[c(T, F)]
  expect_identical(g_one$names, n[1])
  expect_identical(g_one$descriptions, d[1])
  expect_identical(g_one$genesets, g[1])
})

test_that("length is well-defined", {
  expect_equal(length(gs), 2)
})