rm(list=ls())

#准备数据
name <- c("a","b","c")
age <- c(30,55,80)
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

#根据年龄新建分类变量
dataframe1 <- within(dataframe1,{
  ageCat <- NA
  ageCat [age >75] <- "Elder"
  ageCat [age >= 55 & age <= 75] <- "Middle "
  ageCat [age < 55] <- "Young"
})
dataframe1$ageCat <- factor(dataframe1$ageCat, ordered = TRUE, levels =c("Elder","Middle","Young"))
  #将ageCat转换成因子，并且为有序型变量，并指定顺序
dataframe1
str(dataframe1)

#按照某一列进行排序，存储到newData
newData <- dataframe1[order(dataframe1$q1),]
newData

#横向合并数据框
q3 <- c(12,4,45)
q4 <- c(43,23,12)
dataFrame2 <- data.frame(q1,q3,q4) 
dataFrame2
total <- merge(dataframe1,dataFrame2,by = "q1")
  #在两个数据框中，将相同q1的行合并
total 
order1 <- c("name","ageValue","sex","meanValue","ageCat","q1","q2","q3","q4")
total <- total[order1]
  #对total的变量重新排序
total

#按照name的顺序排序
total <- total[order(total$name),]
total

#subset函数选取数据
newData <- subset(total, ageValue >= 40 & sex == "female", selecet=1:10)
  #select 表示选择哪些变量放到新的数据框中
newData

#从total中随机抽样
total
mySample <- total[sample(1:3,2,replace = FALSE),]
mySample
