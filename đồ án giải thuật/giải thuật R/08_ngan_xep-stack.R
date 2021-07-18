library(dequer)
s <- stack()
# Them gia tri vao nganxep
for (i in 1:5) push(s, i)
str(s)

#Lay 1 phantu ra khoi nganxep
pop(s)
## [1] 5
#Nganxep hientai
str(s)

