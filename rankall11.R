rankall <- function(outcome, num ="best"){
  
  data <- read.csv("/Users/alex/Documents/R directory/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses= "character", na.strings = "NA")
  subdat <- data[,c(2,7,11,17,23)]
  colnames(subdat) <- c("hospital","state","heart attack", "heart failure", "pneumonia")
  outList <- c("heart attack", "heart failure", "pneumonia")
  
  if (!outcome %in% outList) {
    stop("invalid outcome")    
  }
     
  else {
    
    stateSub <- subset(subdat, select=c("hospital","state",outcome))
    
    stateSub[,3] <- as.numeric(stateSub[,3]) 
    good <- complete.cases(stateSub)
    preSubOrder <- stateSub[good,]
    subOrder <- preSubOrder[order(preSubOrder[,3],preSubOrder[,1]),]
    subOrder <- subOrder[,-3]
    
    s1 <- split(subOrder,subOrder$state)
    result <- c(rep,length(s1))
    for(i in seq_len(length(s1))) {
      if(num=="best"){
        n <- 1
        result[i] <- lapply(s1[i],"[",n ,1:2)
        
      }
      else if(num=="worst"){
        n <-lapply(s1[i],nrow)
        n <- as.character(n)
        result[i] <- lapply(s1[i],"[",n,1:2)
      }
      else {
        result[i] <- lapply(s1[i],"[",num,1:2)
      }
    }
    #library(data.table)
    #fResult <- rbindlist(result)
    fResult <- do.call(rbind.data.frame, result)
    good <- complete.cases(fResult)
    fResult <- fResult[good,]
  }
  fResult
}