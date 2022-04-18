#' @title Look up the zipcode data you need (You can choose multiple zipcodes).
#' @description This function will pull out the data with specific zipcodes.
#' @details The dataset must be the dataset from \url{'https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv'}.
#' If want to use your own dataset, it must contains the variabels of following names: date, pop, Spline_WW_weight, ZIPCODE.
#' @return A list of data frames. The data frames are the wastewater information of your choice.
#' @param data A wastewater dataset, with variable date, population, zipcodes, Spline_WW_weight
#' @param zipcodes A int vector, represents the zipcodes you want to choose.
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
#' zips<-zip.puller(df,c("77002","77003"))
#' #take a look at the result
#' coh_waste
#' #when you choose the zipcodes that doesn't exist, it will warn you.
#' zip.puller(df,"12345")

zip.puller<-function(data,zipcodes){
  zipcode=as.character(zipcodes)
  df<-split.zip(data)
  temp<-names(df)
  stopifnot("You have input a/several Zipcodes that doesn't/don't exist in your dataset"= zipcode %in% temp)
  result<-df[temp %in% zipcode]
  return(result)
}





