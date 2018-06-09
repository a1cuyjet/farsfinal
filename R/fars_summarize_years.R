#' @title Total Accidents by Month/Year
#' @description Creates by-year summary of the data showing the number of accidents in each month by year.
#'
#' @param years A list of numeric strings containing the years to obtain summary data for.
#'
#' @importFrom dplyr bind_rows
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom tidyr spread
#' @importFrom magrittr %>%
#'
#' @return Returns summary as a dataframe. This function will return an error if the year specified does not correspond to a dataset.
#' @examples
#' \dontrun{fars_summarize_years(c(2014,2015))}
#'
#' @export

fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
