
# NUNCA USE library() EM PACOTES

# 1 -
# usethis::create_package() # rodado fora

# 2 -
# tem que rodar a licença antes de editar a descrição
usethis::use_mit_license()

# 3 - preencher a Description, de description pra cima somente

# 4 - check
devtools::load_all()
devtools::check()

# 4 - use GIT
# usethis::use_git()
# usethis::use_github()


#5 Criando caixa de areia
usethis::use_data_raw("meus_dados")

#5 - criar funções na pasta R
usethis::use_r('my1func.R') # cria um .r vazio
# devtools::load_all() deixa todas disponiveis pra voce usar
# declare sempre pacote::funcao

# Recomendações
# Algumas recomendação sobre como organizar seu código:
# Evite usar . no nome das suas funções (hoje em dia usar _ é muito mais comum)
# Use nomes descritivos para as funções, pois isso facilita a manutenção e o uso do pacote
# Tente se limitar a 80 caracteres por linha porque isso permite que seu código caiba confortavelmente em qualquer tela
# Não use library() ou require(), pois isso vai causar problemas (use a notação pacote::função())
# Nunca use source(), todo o código já será carregado automaticamente com devtools::load_all()
# Não usar "metapackages" (como o tidyverse)


# 5 documenta a função - no mesmo codigo logo acima da mesma
# use menu code - Insert Roxygen skeleton
# devtools::document() salva a documentação das funções

# 6 adicionando dependencias
usethis::use_package() # cran
usethis::use_dev_package() # github
usethis::use_pipe() # especial para usar o pipe
# não é interessante por o tidyverse, sempre por os individuais

# 6 inserindo dados
# usethis::use_data( obj_R ) # cria a pasta data e o objeto ja vai como .rda
#partidas_brasileirao <- readr::read_csv2("https://git.io/JOqUN")
#usethis::use_data(partidas_brasileirao)
# documemtar os dados usethis::use_r(dados.R)
# copia o template dos slides e preenche, pode ser varios
# documentos na mesma base
# ao final da devtools::document()

# 7 instacao local em outro projeto
# devtools:install - library(meu1pacote)


# 8 Repita os checks -> commit -> push


# 9 TESTES
# usethis::use_testthat() - cria a pasta
# 1 arquivo de teste para cada arquvio de funções
# usethis::use_test()
# roda detools::check()











