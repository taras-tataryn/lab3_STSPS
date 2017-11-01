complete <- function(directory, id = 1:332){
  
  dir <- paste(getwd(), "/", directory, "/", sep = "")
  files <- list.files(dir)
  
  result <- matrix(nrow=0, ncol=2)
  
  for(i in 1:length(id)){
    con <- file(paste(getwd(), "/", directory, "/", files[id[i]], sep = ""))
    data <- read.csv(con)
    
    completeData <- subset(data, !is.na(sulfate) & !is.na(nitrate))
    result <- rbind(result, list(i, nrow(completeData)))
  }
  
  result <- data.frame(result)
  colnames(result) <- c("id","nobs")
  result
}