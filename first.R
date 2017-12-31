


conn<-file("stanford-en-all.txt" , open = "r")
linn<-readLines(conn)
for(i in seq(length(linn))){
  print(linn[i])
  
  for(i in length())
  
}
close(conn)

x<-linn[1]

sum<-0

x<-lapply(strsplit(linn[2]," ") , as.numeric)

sum<- 0
for(i in seq(x[[1]])){
  for(j in seq(x[[1]])) {
    sum<- sum + abs(x[[1]][i] - x[[1]][j])
    
  }
}    

