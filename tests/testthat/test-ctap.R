
context("Taper constraints -- as.tapers")

taps <- c(0,1:10,100)
test_that("Constrained-range is correct",{
  
  ataps <- as.tapers(taps)
  expect_equal(min(ataps),  1)
  expect_equal(max(ataps), max(taps))
  
  ataps.s <- as.tapers(taps, setspan = TRUE)
  expect_equal(min(ataps.s), min(minspan(taps)))
  expect_equal(max(ataps.s), max(minspan(taps)))
  
})


context("Taper constraints -- ctap_simple_rcpp")

taps <- c(0,1:10,100)
test_that("Constrained-range is correct",{
  
  taps.c <- ctap_simple_rcpp(taps, maxslope=1)
  taps.c2 <- ctap_simple_rcpp(taps, maxslope=2)
  
  expect_equal(min(taps.c), 1)
  expect_equal(min(taps.c2), 1)
  expect_equal(max(taps.c), 11)
  expect_equal(max(taps.c2), 12)
  
})

test_that("ctap handles bad input",{
  
  expect_equal(ctap_simple_rcpp(NA), 1)
  expect_warning(ctap_simple_rcpp(Inf))
  expect_error(ctap_simple_rcpp(NULL))
  expect_error(ctap_simple_rcpp(1, maxslope=-1))
  
})


context("Taper constraints -- minspan")

test_that("Length and positivity requirements",{
  
  expect_error(minspan(1))
  expect_error(minspan(0))
  expect_error(minspan(-1))
  expect_error(minspan(-1:0))
  
})

test_that("Number of tapers limited by section length", {
  
  ms. <- minspan(0:2)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 1)
  
  ms. <- minspan(0:3)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 2)
  
  ms. <- minspan(0:4)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 2)
  
  ms. <- minspan(0:5)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 3)
  
  ms. <- minspan(0:6)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 3)
  
  ms. <- minspan(0:7)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
})

test_that("Strange values are dealt with", {
  
  expect_warning(ms. <- minspan(c(0:7,Inf)))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 9)
  
  ms. <- minspan(c(0:7,NA))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 9)
  
  ms. <- minspan(c(0:7,""))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 9)
  
  ms. <- minspan(c(0:7,NULL))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 8) # instead of 9
  
})