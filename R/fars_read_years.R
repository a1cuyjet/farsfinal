#' @title Month/Year Subset
#' @description This function subsets the data to look only at month and year.
#'
#' @param years A list of numeric strings containing the years to obtain accident data for.
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom magrittr %>%
#'
#' @return Returns a list with the months and selected year(s). A separate list is returned for each year. This function will return an error if the specified year does not correspond to a dataset.
#' @examples
#' \dontrun{fars_read_years(2014)}
#'
#' @export

fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
