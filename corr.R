corr <- function(directory, threshold = 0){
  result = numeric(0)
  
  dir <- paste(getwd(), "/", directory, "/", sep = "")
  files <- list.files(dir)
  
  cpl <- complete(directory)
  cplWithThresHold <- subset(cpl, nobs > threshold)
  
  ids <- cplWithThresHold[,c("id")]
  
  for(id in ids){
    con <- file(paste(getwd(), "/", directory, "/", files[id], sep = ""))
    data <- read.csv(con)
    
    completeData <- subset(data, !is.na(sulfate) & !is.na(nitrate))
    result <- c(result, cor(completeData[,c("sulfate")],completeData[,c("nitrate")]))
  }
  result
}