rankall<- function(outcome,num ="best"){
        
        data<- read.csv("outcome-of-care-measures.csv",colClasses = "character",na.strings = "Not Available")
        
        outcomes <- c("heart attack","heart failure","pneumonia")
        unique_states <-sort(unique(data[,7]))
        hospital <- character(0)
        if(!outcome %in% outcomes){
                stop(print("invalid outcome"))
        }
        if(outcome=="heart attack"){
                col_data<-11
        }
        if(outcome=="heart failure"){
                col_data<-17
        }
        if(outcome=="pneumonia"){
                col_data<-23
        }
        for (i in seq_along(unique_states)) {
                data_state<- data[data$State == unique_states[i],]
                data_state[,col_data]<-as.numeric(data_state[,col_data])
                bad<- is.na(data_state[,col_data])
                good_data <- data_state[!bad,]
                
                sort_data <- good_data[order(as.double(good_data[[col_data]]), good_data[["Hospital.Name"]],decreasing = FALSE,na.last = TRUE),]
                
                if (num == "best"){num=1}
                if (num == "worst"){num=nrow(sort_data)}
                hospital[i] <- sort_data[num,"Hospital.Name"]
        }
        data.frame(hospital= hospital,state= unique_states, row.names = unique_states)
}
