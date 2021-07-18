library(tidyverse)
place_queen <- function(queens=c()) {
  if (length(queens) == 8) {
    return(list(queens))
  }
  possible_placements <- setdiff(1:8, queens)
  diag_offsets <- seq.int(length(queens), 1)
  diags <- c(queens + diag_offsets, queens - diag_offsets)
  diags <- diags[diags > 0 & diags < 9]
  
  possible_placements <- setdiff(possible_placements, diags)
  possible_placements %>% 
    map(~place_queen(c(queens, .x))) %>%
    keep(~length(.x) > 0) %>%
    flatten()
}



#Vitri 8 vector cua 8 hau
plot_single_8queens <- function(queens, title = NULL) {
  queens_df <- tibble(cols = queens, rows=1:8)
  board_df <- expand.grid(cols = 1:8, rows = 1:8) %>% 
    mutate(check = (cols + rows) %%2 == 1)
  
  p <- ggplot(queens_df, aes(rows, cols)) + 
    geom_tile(data=board_df, aes(fill=check), colour='black') +
    geom_text(label='\u2655', family="Arial Unicode MS", size = 8) + 
    theme_void() + 
    coord_equal() + 
    scale_fill_manual(values = c('TRUE'='white', 'FALSE'='grey70')) + 
    theme(
      legend.position = 'none'
    ) 
  
  if (is.null(title)) {
    p <- p + labs(title = paste("Queens:", deparse(as.numeric(queens)))) 
  } else {
    p <- p + labs(title = title)
  }
}


solutions <- place_queen()
plot(plot_single_8queens(solutions[[1]]))
plot(plot_single_8queens(solutions[[2]]))

