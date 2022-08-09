clear all;
clc;

Path = 'C:\Users\kkxx\Documents\MATLAB\modeling\a13\';% 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.txt'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1);    % 获取所提取数据文件的个数
  B=[];
  C=[];
for k = 1 : Length_Names
    % 连接路径和文件名得到完整的文件路径
    K_Trace = strcat(Path, FileNames(k));
    % 读取数据（因为这里是.txt格式数据，所以直接用load()函数)
    eval(['Data',num2str(k),'=','load(K_Trace{1,1})',';']);
    % 注意1：eval()函数是括号内的内容按照命令行执行，
    %       即eval(['a','=''2','+','3',';'])实质为a = 2 + 3;
    % 注意2：由于K_Trace是元胞数组格式，需要加{1,1}才能得到字符串
    a=load(K_Trace{1,1});
    A=[B;a];
    B=A;
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D1=[C;y1];
    C=D1;
end
%Y1=zscore(D1);
Y1=D1;%标准化数据
[coef,score,latent,tsquare]=pca(Y1);%主成分分析
 E1=Y1*coef(:,1:2);%得出降维后的数据
 u1=E1(:,1);
 v1=E1(:,2);
plot(u1,v1,'r.')
hold on

Path = 'C:\Users\kkxx\Documents\MATLAB\modeling\b14\';% 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.txt'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1);    % 获取所提取数据文件的个数
  B=[];
  C=[];
for k = 1 : Length_Names
    % 连接路径和文件名得到完整的文件路径
    K_Trace = strcat(Path, FileNames(k));
    % 读取数据（因为这里是.txt格式数据，所以直接用load()函数)
    eval(['Data',num2str(k),'=','load(K_Trace{1,1})',';']);
    % 注意1：eval()函数是括号内的内容按照命令行执行，
    %       即eval(['a','=''2','+','3',';'])实质为a = 2 + 3;
    % 注意2：由于K_Trace是元胞数组格式，需要加{1,1}才能得到字符串
    a=load(K_Trace{1,1});
    A=[B;a];
    B=A;
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D2=[C;y1];
    C=D2;
   
end
%Y2=zscore(D2);
Y2=D2;%标准化数据
[coef,score,latent,tsquare]=pca(Y2);%主成分分析
 E2=Y2*coef(:,1:2);%得出降维后的数据
 u2=E2(:,1);
 v2=E2(:,2);
plot(u2,v2,'r.')
hold on
 
 Path = 'C:\Users\kkxx\Documents\MATLAB\modeling\c15\';% 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.txt'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1);    % 获取所提取数据文件的个数
  B=[];
  C=[];
for k = 1 : Length_Names
    % 连接路径和文件名得到完整的文件路径
    K_Trace = strcat(Path, FileNames(k));
    % 读取数据（因为这里是.txt格式数据，所以直接用load()函数)
    eval(['Data',num2str(k),'=','load(K_Trace{1,1})',';']);
    % 注意1：eval()函数是括号内的内容按照命令行执行，
    %       即eval(['a','=''2','+','3',';'])实质为a = 2 + 3;
    % 注意2：由于K_Trace是元胞数组格式，需要加{1,1}才能得到字符串
    a=load(K_Trace{1,1});
    A=[B;a];
    B=A;
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D3=[C;y1];
    C=D3;
end
%Y3=zscore(D3);
Y3=D3;%标准化数据
[coef,score,latent,tsquare]=pca(Y3);%主成分分析
 E3=Y3*coef(:,1:2);%得出降维后的数据
  u3=E3(:,1);
 v3=E3(:,2);
plot(u3,v3,'r.')
hold on

%figure(2);
%axis([-5 5 -5 5]);

z1=ones(40,1);
label1=z1+12;   %第一个类数据和标号
z2=ones(20,1);
label2=z2+13;  %第二个类数据和标号
label3=label2+1;  %第三个类数据和标号


data=[E1;E2;E3];
label=[label1;label2;label3];


Path = 'C:\Users\kkxx\Documents\MATLAB\forecast\';% 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.txt'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1);    % 获取所提取数据文件的个数
  B=[];
  C=[];
for k = 1 : Length_Names
    % 连接路径和文件名得到完整的文件路径
    K_Trace = strcat(Path, FileNames(k));
    % 读取数据（因为这里是.txt格式数据，所以直接用load()函数)
    eval(['Data',num2str(k),'=','load(K_Trace{1,1})',';']);
    % 注意1：eval()函数是括号内的内容按照命令行执行，
    %       即eval(['a','=''2','+','3',';'])实质为a = 2 + 3;
    % 注意2：由于K_Trace是元胞数组格式，需要加{1,1}才能得到字符串
    a=load(K_Trace{1,1});
    A=[B;a];
    B=A;
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D1=[C;y1];
    C=D1;  
end
 X=D1;
 %X=zscore(D1);%标准化数据
[coef,score,latent,tsquare]=pca(X);%主成分分析
 E4=X*coef(:,1:2);%得出降维后的数据
L=size(E4,1);
  u4=E4(:,1);
 v4=E4(:,2);
plot(u4,v4,'k.')
hold on

figure(2);
K=28;   
%测试数据，KNN算法看这个数属于哪个类
C=[];
D=[];
year_all=[];
for ii=1:L
    m1=E4(ii,1);
    n1=E4(ii,2);
    test_data=[m1 n1];  %测试数据
        label=[label1;label2;label3];
        %%下面开始KNN算法，显然这里是11NN。
        %求测试数据和类中每个数据的距离，欧式距离（或马氏距离） 
        distance=zeros(80,1);
        
        for i=1:80
            distance(i)=sqrt((test_data(1)-data(i,1)).^2+(test_data(2)-data(i,2)).^2);
        end
        g1=[label,distance];
        %选择排序法，只找出最小的前K个数据,对数据和标号都进行排序
        [x,label_last]=sort(distance);
       % g2=sortrows(g1,2)
        %label_last=g2(:,1);
        
        for j=1:80
           a1=label_last(j,1);
            if a1>66
                label_last(j,1)=15;
            else if a1>53
                    label_last(j,1)=14;
                else
                    label_last(j,1)=13;
                end
           end
        end
        
        cls1=0; %统计类1中距离测试数据最近的个数
        cls2=0;
        for i=1:K
           if label_last(i)==13
               cls1=cls1+1;
           else if  label_last(i)==14
                   cls2=cls2+1;
               end
           end
        end
        cls3=K-cls1-cls2;    %类2中距离测试数据最近的个数
       
        if cls1>cls2 
            cls=cls1;
            if cls3>cls;
                hold on
               year=15;
            else 
                plot(m1,n1,'b.');
                hold on
                year=13;
            end
        else  %cls2>cls1
            cls=cls2;
            if cls3>cls;
                plot(m1,n1,'y.');
                hold on
                year=15;
            else
                plot(m1,n1,'g.');
                hold on
                year=14;
            end
        end
        year_all=[year_all;year];   
end

year_true=[];
for jj=1:70
    if jj>60
        year_true=[year_true;15];
    else if jj>30
            year_true=[year_true;14];
        else
            year_true=[year_true;13];
        end
    end
end

h=0;
for i=1:70
    aa=year_all(i,1);
    bb=year_true(i,1);
    if aa==bb
        h=h+1;
    end
end
   
accurate=h/70;
disp([num2str(accurate*100),'%']) 
 
figure(3);

hold on;
plot(year_true,'o');
legend('实际测试集分类');
title({'\bfK近邻算法分类';'测试集的实际分类'},'FontSize',10);


figure(4);
hold on
plot(year_true,'o');

plot(year_all,'r*');

legend('实际测试集分类','预测测试集分类');
title({'测试集的实际分类和预测分类图';'                                                      \bfK近邻算法分类'},'FontSize',10);

