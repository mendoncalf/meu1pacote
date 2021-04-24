
#' Encontra pior ano do Brasilirao de um time
#'
#' Usando a base do Brasileirao, encontra o ano com o menor
#' numero de vitorias desse time
#'
#' @param time Uma string, o nome de um time ('Cruzeiro' por padrao)
#'
#' @return Uma tibble com tres colunas
#' @export
#'
#' @examples
#' encontrar_pior_ano_time(time = "Cruzeiro")
encontrar_pior_ano_time = function(time = "Cruzeiro"){
  #"https://git.io/JOqUN" %>%
  #readr::read_csv2() %>%
    meu1pacote::partidas_brasileirao %>%
    dplyr::group_by(.data$temporada, .data$quem_ganhou) %>%
    dplyr::filter(.data$quem_ganhou != "Empate", .data$quem_ganhou %in% time) %>%
    dplyr::count(.data$quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
    dplyr::ungroup() %>%
    dplyr::filter(.data$n_vitorias == min(.data$n_vitorias)) %>%
    dplyr::rename("time" = .data$quem_ganhou)
}



#' Encontra o melhor time da temporada
#'
#' @param ano Uma string, um valor de ano. `Default = NULL` retorna todos os anos
#'
#' @return Uma tibble com tres colunas
#' @export
#'
#' @examples
#' melhor_time_temporada(ano = '2003')
melhor_time_temporada = function(ano = NULL){


  if(is.null(ano)){

    "https://git.io/JOqUN" %>%
      readr::read_csv2() %>%
      dplyr::group_by(.data$temporada) %>%
      dplyr::filter(.data$quem_ganhou != "Empate") %>%
      dplyr::count(.data$quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
      dplyr::filter(.data$n_vitorias == max(.data$n_vitorias)) %>%
      dplyr::arrange(.data$temporada)

  }else{

    "https://git.io/JOqUN" %>%
      readr::read_csv2() %>%
      dplyr::group_by(.data$temporada) %>%
      dplyr::filter(.data$quem_ganhou != "Empate", .data$temporada %in% ano) %>%
      dplyr::count(.data$quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
      dplyr::filter(.data$n_vitorias == max(.data$n_vitorias)) %>%
      dplyr::arrange(.data$temporada)
  }
}


#' Encontra marmitas veganas
#'
#' @return Uma tibble com todas as marmitas disponiveis
#' @export
#'
#' @examples
#' buscar_marmitas_veganas()
buscar_marmitas_veganas = function() {

  nm <- c("nome", "desc", "peso", "valor", "add")
  "https://www.beleaf.com.br/cardapio-marmitas-veganas" %>%
    xml2::read_html() %>%
    xml2::xml_find_all("//div[contains(@class, 'product-item-details')]") %>%
    purrr::map(~ stringr::str_squish(xml2::xml_text(xml2::xml_children(.x)))) %>%
    purrr::map_dfr(~ tibble::enframe(purrr::set_names(.x, nm)), .id = "item") %>%
    tidyr::pivot_wider() %>%
    dplyr::select(.data$item, .data$nome, .data$desc, .data$peso, .data$valor)
}

