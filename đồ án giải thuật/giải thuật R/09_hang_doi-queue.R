library(dequer)
q <- queue()
for (i in 1:3) pushback(q, i)
str(q)
## queue of 3
##  $ : int 1
##  $ : int 2
##  $ : int 3
pop(q)
## [1] 1
str(q)
## queue of 2
##  $ : int 2
##  $ : int 3