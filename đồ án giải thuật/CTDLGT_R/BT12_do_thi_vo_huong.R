library(igraph)

# Vo Huong
help(make_graph)
vohuong<-make_graph(c("A","B", "B","C", "C","D", 'D','A'), directed = FALSE)
plot(vohuong)
