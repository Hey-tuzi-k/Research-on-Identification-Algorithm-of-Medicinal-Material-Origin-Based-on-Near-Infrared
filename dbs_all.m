clear all;
close all;
clc;

Path = 'C:\Users\kkxx\Documents\MATLAB\all\';% 设置数据存放的文件夹路径
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
    figure(1);
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D=[C;y1];
    C=D;
   % plot(x,y);
    hold on 
end
%x=A(:,1);
 figure(1);
%X=D;
 X=zscore(D);%标准化数据
[coeff,score,latent1,tsquared,explained]= pca(X) ;
%[coef,score,latent,tsquare]=princomp(X);%主成分分析
  %latent';%特征值
 %explan=(100*latent/sum(latent));%特征值贡献率
 F=X*coeff(:,1:2);%得出降维后的数据

% scatter(m1,n1,'b');

%  x=[randn(3 , 2)*.4;  randn(4,2)*.5 + ones(4,1)*[4 4]];

[class,type]=dbscan(F,7,[]);
%[class,type]=dbscan(x,7,[]);
%[class,type]=dbscan(x,10,[]);
%[class,type]=dbscan(x,10,2);
%[class,type]=dbscan(F,6,0.61626);
%[class,type]=dbscan(F,7,[]);
color_cluster(F,class);
title('{\bf DBSCAN聚类算法图像}');
