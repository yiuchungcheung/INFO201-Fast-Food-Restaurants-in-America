# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(data) {
  ret <- list()
  #values
  tot_rest <- nrow(data)
  
  tot_mcd <-data %>%
    filter(name == "McDonald's") %>%
    nrow()
  
  top_cities <- data %>%
    group_by(city) %>%
    summarise(num_rest = n()) %>%
    top_n(3, wt = num_rest) %>%
    pull(city)
  
  top_states <- data %>%
    group_by(province) %>%
    summarise(num_rest = n()) %>%
    top_n(3, wt = num_rest) %>%
    pull(province)
  
  avg_each_state <- nrow(data)/47
  
  top_3_restaurants <- data %>%
    group_by(name) %>%
    summarise(num_rest = n()) %>%
    top_n(3, wt = num_rest) %>%
    pull(name)
  
  ret$tot_mcd <- tot_mcd
  ret$tot_rest <- tot_rest
  ret$top_cities <- top_cities
  ret$top_states <- top_states
  ret$top_r <- top_3_restaurants
  ret$avg_state <- avg_each_state
  
  return(ret)
  
  #return (list(tot_rest, avg_each_state, top_states, top_cities, top_3_restaurants))
} 