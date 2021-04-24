test_that("encontrar_pior_ano_time() works", {

  #tibble
  expect_s3_class(encontrar_pior_ano_time(),"tbl")
  expect_equal(ncol(encontrar_pior_ano_time()),3)
  expect_equal(nrow(encontrar_pior_ano_time()),1)

  #valores
  expect_equal(encontrar_pior_ano_time()$temporada, 2019)
  expect_equal(encontrar_pior_ano_time('São Paulo')$temporada, 2017)

})

# outra função
# test_that("encontrar_pior_ano_time() works", {
#
#   #tibble
#   expect_s3_class(encontrar_pior_ano_time(),"tbl")
#   expect_equal(ncol(encontrar_pior_ano_time()),3)
#   expect_equal(nrow(encontrar_pior_ano_time()),1)
#
#   #valores
#   expect_equal(encontrar_pior_ano_time()$temporada, 2019)
#   expect_equal(encontrar_pior_ano_time('São Paulo')$temporada, 2017)
#
# })

