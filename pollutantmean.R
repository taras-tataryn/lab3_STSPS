pollutantmean <- function(directory, pollutant = "sulfate", id= 1:332){
  
  dir <- paste(getwd(), "/", directory, "/", sep = "")
  files <- list.files(dir)
  
  result <- 0
  records <- 0
  
  for(i in 1:length(id)){
    con <- file(paste(getwd(), "/", directory, "/", files[id[i]], sep = ""))
    data <- read.csv(con)
    
    pollutantData <- data[pollutant]
    notNApollutantData <- as.numeric(pollutantData[!is.na(pollutantData)])
    
    records <- records + length(notNApollutantData)
    
    result <- result + sum(notNApollutantData)
  }
  result/records
}
