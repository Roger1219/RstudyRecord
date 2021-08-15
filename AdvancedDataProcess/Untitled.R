rm(list= ls())
#创建一个数据框供演示
rName <- c("John Davis","Angela Williams","Bullwinkle Moose","David Jones","Janice Markhammer","Cheryl Cushing","Reuven Ytzrhak","Greg Knox","Joel England","Mary Rayburn")
MathScore <- c(502,600,412,358,495,512,410,625,573,522)
ScienceScore <- c(95,99,80,82,75,85,80,95,89,86)
EnglishScore <- c(25,22,18,15,20,28,15,30,27,18)
tableData <- data.frame(rName,MathScore,ScienceScore,EnglishScore,stringsAsFactors = FALSE)

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

