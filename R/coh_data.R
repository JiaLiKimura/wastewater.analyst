#' @title Pull out the wastewater data whithin Cith Of Houston Area.
#' @description This function will pull out the data within COH area.
#' @details The dataset must be the dataset from \url{'https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv'}.
#' If want to use your own dataset, it must contains the variabels of following names: date, pop, Spline_WW_weight, ZIPCODE.
#' @return A data frames. The data frames is the wastewater information of City Of Houston.
#' @param data A wastewater dataset, with variable date, population, zipcodes, Spline_WW_weight
#' @export
#' @import magrittr
#' @importFrom magrittr %>%
#' @import dplyr
#' @importFrom dplyr filter
#' @examples
#' library(wastewater.analyst)
#' # Read the most up to date version of wastewater zip data
#' df=update()
#' #work out the data we need
#' coh_waste<-coh_data(df)
#' coh_waste
coh_data<-function(data){
  zipcode=cohzip
  df=data%>%filter(ZIPCODE %in% zipcode)
  return(df)
}





