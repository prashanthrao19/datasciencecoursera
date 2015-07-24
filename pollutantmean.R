pollutantmean <- function(directory, pollutant, id =1:332)
{ 
  mydata<- data.frame()
  
  files<- list.files(directory, pattern =".csv", full.names = TRUE)
  
  my_data<- do.call("rbind", lapply(files[id], read.csv, header = TRUE,sep=","))
    
  data<- subset(my_data,select= pollutant)
     
  mean(data[,1],na.rm = TRUE)
}

  
  
      






