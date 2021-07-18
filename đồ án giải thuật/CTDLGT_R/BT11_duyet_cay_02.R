library(data.tree)

# thiet lap cay
tree <- Node$new("A")
#Nhánh 1:
branch1 <- tree$AddChild("B")
child1 <- branch1$AddChild("C")
child2 <- branch1$AddChild("D")
# Nhánh 2
branch2 <- tree$AddChild("E")
child3 <- branch2$AddChild("F")
branchchild <- child3$AddChild("G")
# Nhánh 3
branch3 <- tree$AddChild("H")
child5 <- branch3$AddChild("I")
# Nhánh 4
branch4 <- tree$AddChild("J")
print(tree)

# Duyet Cay sau
tree$Get('level', traversal = "post-order")
