rm(list = ls() )
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

opar <- par(no.readonly =TRUE)
#保存默认图形参数
par(lwd=2, cex=1, font.lab=2)
#设置线条宽度，比例，坐标轴字体
plot(dose, drugA, type="b",
     pch=15, lty=1, col="red", ylim=c(0, 60),
     main = "Drug A vs. Drug B",
     xlab="Drug dosage", ylab="Drug response")
#输出图形1
lines(dose, drugB, type="b",pch=17,lty=2,col="blue")
#在同一个坐标轴画图形2
abline(h=c(30), lwd=1.5, lty =2, col="gray")
#画线

legend("topleft", inset=.05,title="Drug Type",c("A","B"), lty=c(1,2),pch=c(15,17),col=c("red","blue"))
输出图例
par(opar)
#恢复为默认图形参数

attach(mtcars)
rmatrix <- matrix(c(1,1,2,3),2,2,byrow=TRUE)
#设定图片摆放的位置，1代表第一个图占的位置（第一行的两列），2代表第二个图占第二行第一列，3代表第三个图占第二行第二列

layout(rmatrix)
hist(wt)
hist(mpg)
hist(disp)
hist(disp)
detach(mtcars)

    