rm(list=ls())

#准备数据
name <- c("a","b","c")
age <- c(1,2,3)
q1 <- c(43,31,53)
q2 <- c(45,64,78)
#构造数据框
dataframe1  <- data.frame(name,age,q1,q2,stringsAsFactors = FALSE)
dataframe1
str(dataframe1)

#重新增加数据框数据
attach(dataframe1)
  #实用attach后可直接调用数据框内的变量名，否则需要加数据框名dataframe1
dataframe1$sex <- factor(c("male","female","male"))
dataframe1$meanValue <- (q1 + q2)/2
detach(dataframe1)
dataframe1
str(dataframe1)

#给数据框内变量重命名
names(dataframe1)[2] <- "ageValue"
  #把age改成ageValue
dataframe1
str(dataframe1)
