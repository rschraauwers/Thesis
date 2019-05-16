rankall <- function(outcome, num = "best") {
  ##setwd("C:/Users/Robin/Desktop/assignment 3")
  outcome <- "heart attack"
#-----------------------------------------------------------------------------------------  
  ## Read outcome data
  read_outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## prepare final data frame
  final <- data.frame() 
#---------------------------------------------------------------------------------------------
  
  #check outcome validity
  poss_outcomes <- c("heart attack", "heart failure", "pneumonia") 
  if(!is.element(outcome, poss_outcomes)){
    stop ("invalid outcome")
  }
#----------------------------------------------------------------------------------------------

# Subsetting data depending on outcome
  subset_data <<- data.frame()
  ranking <- data.frame()
  data <- as.numeric()

  if(outcome=="heart attack"){   
    ## make subset with only heart attack mortality data
    subset_data = read_outcome[c("Hospital.Name", "State","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]  
    column_name <<- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    
  }else if (outcome== "heart failure"){ 
    ## make subset with only heart failure mortality data
    subset_data = read_outcome[c("Hospital.Name", "State","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    column_name <<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  }else{ 
    ## make subset with only pmneumonia mortality data
    subset_data = read_outcome[c("Hospital.Name", "State","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    column_name <<- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }

#---------------------------------------------------------------------------------------------------

  ## For each state, find the hospital of the given rank
    poss_num_states <- length(unique(read_outcome[,7]))
    poss_states <- (unique(read_outcome[, 7]))
    
    ##create emty data.frames to store results    
    state_result <<- data.frame() 
    results <<- data.frame()
    semifinal <<- data.frame()
    names(subset_data)[names(subset_data)=="Hospital.Name"] <- "hospital"
    names(subset_data)[names(subset_data)=="State"] <- "state"
    print(head(subset_data))
    print(summary(subset_data))
    
    for(i in 1:poss_num_states){ # loop 54 times
      
      ## make subset of data with only data of that state including their rank
      state_data <- subset(subset_data, subset_data$State==poss_states[i]) 
      ranking <- data.frame(rank(state_data[,3]))
      data <- cbind(ranking, state_data)
      
  
      
      ## find out how many Na's there are in the specified outcome list
      na <- state_data[,3]=="Not Available"
      sum_na <- sum(na) ## number of NA's 
      rank_worst <- as.numeric(nrow(state_data)- sum_na)
#------------------------------------------
      if(num =="worst"){  
        # return hospital with last rank
              rank_multworst <- rank_worst + 0.5
              #print(rank_worst)
        
            ## finding the worst hospital, not counting NA's
            for( j in 1:nrow(state_data)){
              data <- subset(subset_data, subset_data[j,]==state)
              #print(state_data[j,1]== rank_worst) 
                      subset
              if(state_data[j,3]== rank_worst){
                         
                        state_result = state_data[j,1:2]
                        #print(state_result)
                         message("single worst")
                        
                      } else if(state_data[j,3]== rank_multworst){
                        state_result <- data.frame(state_data[j,1:2])
                       # message("multiple worst")
                       # hospitals <- result[,1]
                       # res <- order(hospitals)
                       # print(hospitals)
                        #results <- rbind(results, result)
                        #print(results)
                        #order_state_results <-results[order(Hospital.Name),] 
                        
                       # state_result = order_state_results[1,2:3]
                       # print(state_result)
                         
                      }
                     # newdata <- results[order(Hospital.Name),] 
        }
          
#-----------------------------------------------------        
        }else{
          # return hospital with the specified rank
          #print(state_data[1,])
          for(j in 1:nrow(state_data)){
           # num <- as.numeric(num)
            #numm <- num + 0.5
            #print(state_data[j,3])
            #if((state_data[j,3])== 4){
              
             # state_result = state_data[j,1:2]
             # message ("single")
           # }         
           

         
      } 
 
   ## store all information
   # print(state_result)  
   semifinal = rbind(semifinal, state_result)
}
#--------------------------------------------------------------------------------   
## remove all NA's from data frame
}
  final = semifinal[complete.cases(semifinal),]

#print(final)
#---------------------------------------------------------------------------------
  ## Return a data frame with the hospital names and the state name
  return(final)

# rankall("heart attack", 4)
#rankall("pneumonia", "worst")
#rankall("heart failure", 10)
}