#' @title Define filename
#' @description Defines name of accident data file (as a csv) based on year provided to function.
#'
#' @param year A numeric string containing the year to be used to define file name.
#'
#' @note This function does not check that the input year is an actual year.
#'
#' @return This function returns a character string containing the name of the accident datafile. Example: "accident_2013.csv.bz2". This function will return an error if non-numeric characters are input
#'
#' @examples
#' make_filename(2014)
#'
#' @export

make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
