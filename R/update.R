#' @title Wastewater data reading.
#' @description This function is used for downloading the data from website \url{https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv} created by \strong{Jeff Brennan}.
#' @details Just use this function \strong{direcly}. It will download the waste water data from the website.
#' @return Wastewater dataset with ZipCode information.
#' @export
#' @import utils
#' @importFrom utils read.csv
#' @examples
#' library(wastewater.analyst)
#' df<-update()
#' #output the data
#' df

update<-function(){
  df=read.csv(url('https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv'))%>%select(ZIPCODE,date,pop,Spline_WW_weight)
  return(df)
}







