#' @title Split the wastewater data according to zipcodes.
#' @description This function will split the wastewater data into different parts according to the zipcodes.
#' @details The dataset must be the dataset from \url{'https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv'}.
#' If want to use your own dataset, it must contains the variabels of following names: date, pop, Spline_WW_weight, ZIPCODE.
#' @return A list of data frames. The data frames is the wastewater information of each zip code area, ordered by date.
#' @param data A wastewater dataset, with variable date, population, zipcodes, Spline_WW_weight
#' @rdname split.zip
#' @import magrittr
#' @importFrom magrittr %>%
#' @import dplyr
#' @importFrom dplyr mutate
#' @export
#' @examples
#' library(wastewater.analyst)
#' # Read the most up to date version of wastewater zip data
#' df=update()
#' #work out the data we need
#' zip_group=split.zip(df)
#' #output the data in area '77002'
#' zip_group$`77002`
#' #See what zipcodes you have in your result
#' names(zip_group)

split.zip<-function(data){
  split_zip<-data%>%mutate(ZIPCODE=as.factor(ZIPCODE))
  zip_group=split(x=split_zip,f=split_zip$ZIPCODE,drop=FALSE)
  zip_group=lapply(zip_group,function(x) return(x[order(x$date),]))
  return(zip_group)
}


