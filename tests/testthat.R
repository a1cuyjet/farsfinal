library(testthat)
library(FARS)

test_that("make_filename() creates the filename correctly",{
  expect_equal(make_filename(2014), "accident_2014.csv.bz2")
})

#test_that("make_filename function", expect_equal(make_filename(2013), "accident_2013.csv.bz2"))
