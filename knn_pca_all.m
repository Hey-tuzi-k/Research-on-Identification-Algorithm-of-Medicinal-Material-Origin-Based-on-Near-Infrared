clear all;
clc;

Path = 'C:\Users\kkxx\Documents\MATLAB\modeling\a13\';% �������ݴ�ŵ��ļ���·��
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
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D1=[C;y1];
    C=D1;
end
%Y1=zscore(D1);
Y1=D1;%��׼������
[coef,score,latent,tsquare]=pca(Y1);%���ɷַ���
 E1=Y1*coef(:,1:2);%�ó���ά�������
 u1=E1(:,1);
 v1=E1(:,2);
plot(u1,v1,'r.')
hold on

Path = 'C:\Users\kkxx\Documents\MATLAB\modeling\b14\';% �������ݴ�ŵ��ļ���·��
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
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D2=[C;y1];
    C=D2;
   
end
%Y2=zscore(D2);
Y2=D2;%��׼������
[coef,score,latent,tsquare]=pca(Y2);%���ɷַ���
 E2=Y2*coef(:,1:2);%�ó���ά�������
 u2=E2(:,1);
 v2=E2(:,2);
plot(u2,v2,'r.')
hold on
 
 Path = 'C:\Users\kkxx\Documents\MATLAB\modeling\c15\';% �������ݴ�ŵ��ļ���·��
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
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D3=[C;y1];
    C=D3;
end
%Y3=zscore(D3);
Y3=D3;%��׼������
[coef,score,latent,tsquare]=pca(Y3);%���ɷַ���
 E3=Y3*coef(:,1:2);%�ó���ά�������
  u3=E3(:,1);
 v3=E3(:,2);
plot(u3,v3,'r.')
hold on

%figure(2);
%axis([-5 5 -5 5]);

z1=ones(40,1);
label1=z1+12;   %��һ�������ݺͱ��
z2=ones(20,1);
label2=z2+13;  %�ڶ��������ݺͱ��
label3=label2+1;  %�����������ݺͱ��


data=[E1;E2;E3];
label=[label1;label2;label3];


Path = 'C:\Users\kkxx\Documents\MATLAB\forecast\';% �������ݴ�ŵ��ļ���·��
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
    x=a(:,1);
    y=a(:,2);
    y1=y';
    D1=[C;y1];
    C=D1;  
end
 X=D1;
 %X=zscore(D1);%��׼������
[coef,score,latent,tsquare]=pca(X);%���ɷַ���
 E4=X*coef(:,1:2);%�ó���ά�������
L=size(E4,1);
  u4=E4(:,1);
 v4=E4(:,2);
plot(u4,v4,'k.')
hold on

figure(2);
K=28;   
%�������ݣ�KNN�㷨������������ĸ���
C=[];
D=[];
year_all=[];
for ii=1:L
    m1=E4(ii,1);
    n1=E4(ii,2);
    test_data=[m1 n1];  %��������
        label=[label1;label2;label3];
        %%���濪ʼKNN�㷨����Ȼ������11NN��
        %��������ݺ�����ÿ�����ݵľ��룬ŷʽ���루�����Ͼ��룩 
        distance=zeros(80,1);
        
        for i=1:80
            distance(i)=sqrt((test_data(1)-data(i,1)).^2+(test_data(2)-data(i,2)).^2);
        end
        g1=[label,distance];
        %ѡ�����򷨣�ֻ�ҳ���С��ǰK������,�����ݺͱ�Ŷ���������
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
        
        cls1=0; %ͳ����1�о��������������ĸ���
        cls2=0;
        for i=1:K
           if label_last(i)==13
               cls1=cls1+1;
           else if  label_last(i)==14
                   cls2=cls2+1;
               end
           end
        end
        cls3=K-cls1-cls2;    %��2�о��������������ĸ���
       
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
legend('ʵ�ʲ��Լ�����');
title({'\bfK�����㷨����';'���Լ���ʵ�ʷ���'},'FontSize',10);


figure(4);
hold on
plot(year_true,'o');

plot(year_all,'r*');

legend('ʵ�ʲ��Լ�����','Ԥ����Լ�����');
title({'���Լ���ʵ�ʷ����Ԥ�����ͼ';'                                                      \bfK�����㷨����'},'FontSize',10);

