

write_summary<- function() {
  
  summary_data<-data.frame("Language"=character(30),
    "sample_size"=numeric(30), "mean_n"=numeric(30), 
                           "sigma_n"=numeric(30), "mean_d"=numeric(30), "sigma_d"=numeric(30))
  summary_data[,1]<-lang_dict
  
  for(i in seq(lang_dict)){
    metric_value<- compute_mean_edge(lang_dict, i)
    summary_data$sample_size[i]<- nrow(metric_value)
    summary_data$mean_n[i]<- mean(metric_value$node)
    summary_data$sigma_n[i]<- sd(metric_value$node)
    summary_data$mean_d[i]<- mean(metric_value$mean_edge_length)
    summary_data$sigma_d[i]<- sd(metric_value$mean_edge_length)
  }
  return(summary_data)
}