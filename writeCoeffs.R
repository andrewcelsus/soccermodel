scores <- read.csv("scores_data.csv",header=T, sep=",", nrows = 90)

params <- ~c(team1, team2)+c(team2, team1)
model <- lm.bp(g1~1, g2~1, l1l2=params, data=scores, maxit=2)

export_data = data.frame(beta1=model$beta1, beta2=model$beta2,lambda3=model$lambda3[1])
write.table(export_data,"coefficients1.csv",sep=",")