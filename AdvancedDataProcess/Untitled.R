rm(list= ls())
options(digits = 4)
#创建一个数据框供演示
rName <- c("John Davis","Angela Williams","Bullwinkle Moose","David Jones","Janice Markhammer","Cheryl Cushing","Reuven Ytzrhak","Greg Knox","Joel England","Mary Rayburn")
MathScore <- c(502,600,412,358,495,512,410,625,573,522)
ScienceScore <- c(95,99,80,82,75,85,80,95,89,86)
EnglishScore <- c(25,22,18,15,20,28,15,30,27,18)
tableData <- data.frame(rName,MathScore,ScienceScore,EnglishScore,stringsAsFactors = FALSE)
tableData


#将各科成绩进行标准化,均值50，标准差10
z <- scale(tableData[,2:4])*10 +50
#计算每个人3科平均分
meanScore <- apply(z,1,mean)
tableData1 <- cbind(tableData,meanScore)
#求平均分的百分位数
quantileScore <- quantile(meanScore, c(.8,.6,.4,.2))
#根据百分位数给每个学生评级
tableData1$grade <- "F"
tableData1$grade[meanScore >= quantileScore[4]] <- "D"
tableData1$grade[meanScore >= quantileScore[3]] <- "C"
tableData1$grade[meanScore >= quantileScore[2]] <- "B"
tableData1$grade[meanScore >= quantileScore[1]] <- "A"

#统计函数
example1 <- tableData
with(tableData,{
  mathMean <<- mean(MathScore)
    #均数，<<表示在with函数中mathMean存储为全局变量
  mathMedian <<- median(MathScore)
    #中位数
  mathSd <- sd(MathScore)
    #标准差
  mathVar <- var(MathScore)
    #方差
  #min,max 最小值最大值；sum求和
  math25 <- quantile(MathScore, c(.25))
    #quantile(x,probs)求百分位数
})

