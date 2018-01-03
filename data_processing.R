lang_dict<-c("Arabic", "Basque", "Bengali", "Bulgarian", "Catalan", "Czech", "Danish", "Dutch", 
             "English", "Estonian", "German", "Greek (Modern)", "Greek (Ancient)", "Finnish",
             "Hindi", "Hungarian", "Italian", "Japanese", "Latin", "Persian", "Portuguese",
             "Romanian", "Russian", "Slovak", "Slovene", "Spanish", "Swedish", "Tamil", "Telugu",
             "Turkish")

lang_short<-c("ar", "eu", "bn", "bg", "ca", "cs", "da", "nl", "en", "et", "de", "el", "grc", "fi",
              "hi", "hu", "it", "ja", "la", "fa", "pt", "ro", "ru", "sk", "sl", "es", "sv", "ta", 
              "te", "tr")

file_init<- "stanford"
file_extension<- "all.heads2"

generate_metric_file_name<- function(lang) {
  #function for creating the file name for the file containing dependency tree metrics for a given
  #language under consideration
  metric_extension<- c("collection_dependency_tree_metrics.txt")
  fname<- paste(lang, metric_extension, sep = "_")
  return(fname)
}

generate_file_name <-function(lang){
  file_init<- "stanford"
  file_extension<- "all.heads2"
  fname<- paste(file_init, lang, file_extension, sep = "-")
  return(fname)
}

generate_new_file_name<- function(lang) {
  metric_extension<- c("collection_dependency_tree.txt")
  fname<- paste(lang, metric_extension, sep = "_")
  return(fname)
}



change_file_names<- function(){
  # function for changing the file names of original "Stanford-all-heads2" files to new processed 
  # names for each language with identification as language name
  setwd("~/CSN_SML/data")
  for(i in seq(length(lang_dict))) {
    file.rename(from = generate_file_name(lang_short[i]),
                to= generate_new_file_name(lang_dict[i]))
    
  }
  setwd("~/CSN_SML")
}



compute_mean_edge<- function(lang_dict, i) {
  # function for computing the number of nodes and corresponding mean edge length
  # for a given language
  setwd("~/CSN_SML/data")
  
  # Reading the file of i-th language
  conn <- file(generate_new_file_name(lang_dict[i]) , open = "")
  # Reading the file line by line of i-th language 
  linn <- readLines(conn)
  mean_edge_length<-numeric(length = length(linn))
  node<-numeric(length = length(linn))
  
  #iterating for each of the k trees in language
  for(k in seq(length(linn))) {
    x <- lapply(strsplit(linn[k]," ") , as.numeric)[[1]] #storing the k-th line in x
    node[k]<- length(x)
    
    sum<-0
    for(j in seq(length(x))) {
      if(x[j] != 0) {
        sum<- sum + abs(j-x[j])
      }
    }
    mean_edge_length[k]<- sum/node[k]
  }
  val<-data.frame(node, mean_edge_length)
  setwd("~/CSN_SML/")
  close(conn)
  return(val)
}

driver_mean_edge_length<- function(){
  #compute the number of nodes and mean edge length corresponding to the number of nodes
  #for each of the trees in a given language for each of the languages
  #
  dir.create("metric_data")
  metric_value<-data.frame()
  for(i in seq(length(lang_dict))){
    metric_value<- compute_mean_edge(lang_dict, i)
    #dir.create("metric_data")
    write.table(metric_value[,1:2], 
                paste("~/CSN_SML/metric_data", generate_metric_file_name(lang_dict[i]), sep = "/")
                , sep="\t", row.names = F)
    
  }
  
}


x<-c(0, 1, 2, 1, 4, 5)
sum<-0
for(j in seq(length(x))) {
  if(x[j] != 0) {
    sum<- sum + abs(j-x[j])
  }
}



View(data.frame(lang_dict, lang_short))

#commands
# first command for changing the file names using a function
change_file_names()
# command for creating a directory for processed files and storing the files with desired metric
driver_mean_edge_length()
