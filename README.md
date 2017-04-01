# Bayesian estimation
:point_down::fu:贝叶斯估计概率密度<br>
__________________________________________________________________________________________
Author:赵明福                                        Student ID：201400301087                            E-mail:1109646702@qq.com<br>
## 题目介绍
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片16.png)
## 题目分析
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片17.png)<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片18.png)<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片19.png)<br>
## 编程实现及注释
```matlab
%假设参数变量u符合均值为u0 方差为v0的高斯分布
%假设参数变量v符合均值为u1 方差为v1的高斯分布
u0=input('u0=');%设置u0的值
v0=input('v0=');%设置v0的值
u1=input('u1=');%设置u1的值
v1=input('v1=');%设置v1的值
 
u= -5:0.1:5;%设参数变量u的取值范围为-5到5 间隔为0.1
v= -5:0.1:5;%设参数变量u的取值范围为-5到5 间隔为0.1
 
p1=zeros(length(u),length(v));%p1表示p(D|u，v)
p2=zeros(length(u),length(v));%p2表示p(u,v)=p(u)*p(v)
 
x=-5:0.01:5;%设置自变量x的取值范围
result=zeros(length(x),1);%保存对应x值的概率
 
for i=1:length(u)
    for j=1:length(v)
        p2(i,j)=((1/((2*pi)^(1/2)*v0))*exp(-(u(i)-u0)^2/(2*v0*v0)))*((1/((2*pi)^(1/2)*v1))*exp(-(v(j)-u1)^2/(2*v1*v1)));%计算p(u,v)
        temp1=1;
        for k=1:10
            if abs(data2(k,2)-u(i))<v(j)
                temp1=temp1*((v(j)-abs(data2(k,2)-u(i)))/(v(j)*v(j)));%累积计算p(D|u，v)
            else
                temp1=temp1*0;
            end
        end
        p1(i,j)=temp1;
    end
end
 
 

%求和积分得到p(x|D)
for k=1:length(x)
    for i=1:length(u)
        for j=1:length(v)
            if abs(x(k)-u(i))<v(j)
               result(k,1)=result(k,1)+((v(j)-abs(x(k)-u(i)))/(v(j)*v(j)))*p1(i,j)*p2(i,j);
            else
                result(k,1)=result(k,1)+0;
            end
        end
    end
    plot(x(k),result(k,1),'b.');
    hold on;
end
```
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片20.png)<br>
## 结果分析
当u0=0 v0=1 u1=0 v0=1，即参数服从标准正态分布时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片22.png)<br>
从中可以看出x的概率密度函数在大约0.4时达到最高点，沿横轴两侧急剧下降，类似于高斯分布。<br>
当u0=2 v0=2 u1=-2 v0=2时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片23.png)<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片21.png)
