clear all;
close all;
clc;

Path = 'C:\Users\kkxx\Documents\MATLAB\all\';% �������ݴ�ŵ��ļ���·��
File = dir(fullfile(Path,'*.txt'));  % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.txt�ļ���������Ϣ
FileNames = {File.name}';            % ��ȡ���Ϻ�׺��Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��
Length_Names = size(FileNames,1);    % ��ȡ����ȡ�����ļ��ĸ���
  B=[];
  C=[];
for k = 1 : Length_Names
    % ����·�����ļ����õ��������ļ�·��
    K_Trace = strcat(Path, FileNames(k));
    % ��ȡ���ݣ���Ϊ������.txt��ʽ���ݣ�����ֱ����load()����)
    eval(['Data',num2str(k),'=','load(K_Trace{1,1})',';']);
    % ע��1��eval()�����������ڵ����ݰ���������ִ�У�
    %       ��eval(['a','=''2','+','3',';'])ʵ��Ϊa = 2 + 3;
    % ע��2������K_Trace��Ԫ�������ʽ����Ҫ��{1,1}���ܵõ��ַ���
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
 X=zscore(D);%��׼������
[coeff,score,latent1,tsquared,explained]= pca(X) ;
%[coef,score,latent,tsquare]=princomp(X);%���ɷַ���
  %latent';%����ֵ
 %explan=(100*latent/sum(latent));%����ֵ������
 F=X*coeff(:,1:2);%�ó���ά�������

% scatter(m1,n1,'b');

%  x=[randn(3 , 2)*.4;  randn(4,2)*.5 + ones(4,1)*[4 4]];

[class,type]=dbscan(F,7,[]);
%[class,type]=dbscan(x,7,[]);
%[class,type]=dbscan(x,10,[]);
%[class,type]=dbscan(x,10,2);
%[class,type]=dbscan(F,6,0.61626);
%[class,type]=dbscan(F,7,[]);
color_cluster(F,class);
title('{\bf DBSCAN�����㷨ͼ��}');
