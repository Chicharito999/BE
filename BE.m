%�����������u���Ͼ�ֵΪu0 ����Ϊv0�ĸ�˹�ֲ�
%�����������v���Ͼ�ֵΪu1 ����Ϊv1�ĸ�˹�ֲ�
u0=input('u0=');%����u0��ֵ
v0=input('v0=');%����v0��ֵ
u1=input('u1=');%����u1��ֵ
v1=input('v1=');%����v1��ֵ

u= -5:0.1:5;%���������u��ȡֵ��ΧΪ-5��5 ���Ϊ0.1
v= -5:0.1:5;%���������u��ȡֵ��ΧΪ-5��5 ���Ϊ0.1

p1=zeros(length(u),length(v));%p1��ʾp(D|u��v)
p2=zeros(length(u),length(v));%p2��ʾp(u,v)=p(u)*p(v)

x=-5:0.01:5;%�����Ա���x��ȡֵ��Χ
result=zeros(length(x),1);%�����Ӧxֵ�ĸ���

for i=1:length(u)
    for j=1:length(v)
        p2(i,j)=((1/((2*pi)^(1/2)*v0))*exp(-(u(i)-u0)^2/(2*v0*v0)))*((1/((2*pi)^(1/2)*v1))*exp(-(v(j)-u1)^2/(2*v1*v1)));%����p(u,v)
        temp1=1;
        for k=1:10
            if abs(data2(k,2)-u(i))<v(j)
                temp1=temp1*((v(j)-abs(data2(k,2)-u(i)))/(v(j)*v(j)));%�ۻ�����p(D|u��v)
            else
                temp1=temp1*0;
            end
        end
        p1(i,j)=temp1;
    end
end

%��ͻ��ֵõ�p(x|D)
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



    

