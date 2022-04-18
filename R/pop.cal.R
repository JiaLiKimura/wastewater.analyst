#' @title Calculate the weighted sum of Spline_WW_weight in wastewater zip dataset. Also, it will show you a line plot of it.
#' @description This function is used for calculating the weighted sum of Spline_WW_weight variable.
#' The weighted is defined by area_population/total_population
#' @details The dataset must be the dataset from \url{'https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv'}.
#' If want to use your own dataset, it must contains the variabels of following names: date, pop, Spline_WW_weight,ZIPCODE.
#' @return Wastewater data with additional variable: Spline_WW_weight_final, which represents the weighted sum weight. Also return the population of each
#' date.
#' @param data A wastewater dataset, with variable date, population, zipcodes, Spline_WW_weight, ZIPCODE
#' @param datebreaks The breaks of date you want to show on the picture. The default is 1 month. You should type in it directly like \emph{"two month"}
#' @export
#' @import magrittr
#' @importFrom magrittr %>%
#' @import dplyr
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @import ggplot2
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 geom_line
#' @importFrom ggplot2 scale_x_date
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 labs
#' @examples
#' library(wastewater.analyst)
#' # Infile the most up to date version of wastewater zip data
#' df=update()
#' #work out the data we need
#' final_waste<-pop.cal(df)
#' #output the data
#' final_waste

pop.cal<-function(data,datebreaks="1 month"){
  df_pop=data%>%group_by(date)%>%summarise(total_pop=sum(pop,na.rm = TRUE))
  final_waste=data%>%group_by(date)%>%summarise(Spline_WW_weight_final=sum(pop*Spline_WW_weight,na.rm = TRUE))%>%
    mutate(Spline_WW_weight_final=Spline_WW_weight_final/df_pop$total_pop)
  min_date=min(as.Date(final_waste$date),na.rm = TRUE)
  max_date=max(as.Date(final_waste$date),na.rm = TRUE)+15
  datebreaks <- seq(as.Date(min_date), as.Date(max_date),by = datebreaks)
  graph=ggplot(data = final_waste)+geom_point(aes(x=as.Date(date),y=Spline_WW_weight_final))+
    geom_line(aes(x=as.Date(date),y=Spline_WW_weight_final),color="red")+scale_x_date(breaks = datebreaks)+
    theme(axis.text.x = element_text(angle = 30, hjust = 1))+
    labs(title="The Trend Of Waste Water Spline Weight",x="Date",y="Waste Water Spline Weight")
  return(list(final_waste,graph,df_pop))
                     }






