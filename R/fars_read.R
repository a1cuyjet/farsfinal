#' @title Read Data
#' @description Checks that the Fatality Analysis Reporting System datafile from the US National Highway
#' Traffic Safety Administration exists. If it does exist, the data will be read in.
#'
#' @param filename A character string containing the name of file to be read in.
#'
#' @note This function will return an error if data is not in the working directory.
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @return This function returns a dataframe table
#'
#' @examples
#' fars_read("accident_2014.csv.bz2")
#'
#' @export

fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
