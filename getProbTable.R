lambdas <- read.csv("lambdas.csv", header = F)
lambda1 <- lambdas$V1[1]
lambda2 <- lambdas$V2[1]
lambda3 <- lambdas$V3[1]

data_table = bivpois.table(8,8, lambda = c(lambda1,lambda2,lambda3))
write.table(data_table, "prob_table.csv",sep=",")
