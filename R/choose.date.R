#' @title Choose the time period of wastewater data.
#' @description This function is used for setting the time range of wastewater data.
#' @return Wastewater data within specific time range.
#' @param start_date A string, starting time.
#' @param end_date A string, end time.
#' @param data A wastewater dataset with zipcode information.
#' @export
#' @import magrittr
#' @importFrom magrittr %>%
#' @import dplyr
#' @importFrom dplyr filter
#' @examples
#' library(wastewater.analyst)
#' a="2022-01-01"
#' b="2022-03-06"
#' data=read.csv(url('https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv'))
#' df<-choose.date(data,a,b)
#' #output the data
#' df

choose.date<-function(data,start_date,end_date){
  df=data%>%filter(as.Date(date)>=as.Date(start_date) & as.Date(date)<=as.Date(end_date))
  return(df)
}
