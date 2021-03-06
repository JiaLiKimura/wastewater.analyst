% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coh_data.R
\name{coh_data}
\alias{coh_data}
\title{Pull out the wastewater data whithin Cith Of Houston Area.}
\usage{
coh_data(data)
}
\arguments{
\item{data}{A wastewater dataset, with variable date, population, zipcodes, Spline_WW_weight}
}
\value{
A data frames. The data frames is the wastewater information of City Of Houston.
}
\description{
This function will pull out the data within COH area.
}
\details{
The dataset must be the dataset from \url{'https://raw.githubusercontent.com/jeffbrennan/COVID-19/master/tableau/wastewater_zip.csv'}.
If want to use your own dataset, it must contains the variabels of following names: date, pop, Spline_WW_weight, ZIPCODE.
}
\examples{
library(wastewater.analyst)
# Read the most up to date version of wastewater zip data
df=update()
#work out the data we need
coh_waste<-coh_data(df)
coh_waste
}
