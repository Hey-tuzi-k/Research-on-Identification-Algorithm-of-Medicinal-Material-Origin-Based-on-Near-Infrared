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
    plot(x,y);
    hold on 
end
%x=A(:,1);
 figure(2);
 X=zscore(D);%��׼������
% [coeff,score,latent1,tsquared,explained]= pca(X) ;
[coef,score,latent,tsquare]=princomp(X);%���ɷַ���
  latent';%����ֵ
 explan=(100*latent/sum(latent));%����ֵ������
 F=X*coef(:,1:2);%�ó���ά�������
 G=X*coef(:,1:3);
 m1=F(:,1);
 n1=F(:,2);
 scatter(m1,n1,'k.');
figure(3);
 m2=G(:,1);
 n2=G(:,2);
 l2=G(:,3);
 scatter3(m2,n2,l2,'r');
 hold on
  
  
  figure(5);
   X=G;
opts=statset('Display','final');
[Idx,C,SumD,D] = kmeans(X,3,'Distance','city','Replicates',6,'Options',opts);
%��������Ϊ1�ĵ㡣X(Idx==1,1),Ϊ��һ��������ĵ�һ�����ꣻX(Idx==1,2)Ϊ�ڶ���������ĵڶ�������
plot(X(Idx==1,1),X(Idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(Idx==2,1),X(Idx==2,2),'b.','MarkerSize',12)
hold on
plot(X(Idx==3,1),X(Idx==3,2),'m.','MarkerSize',12)
hold on
%plot(X(Idx==4,1),X(Idx==4,2),'g.','MarkerSize',12)
%hold on

title('{\bf Kmeans�����㷨ͼ��}');
%����������ĵ�,kx��ʾ��Բ��
plot(C(:,1),C(:,2),'kx','MarkerSize',12,'LineWidth',2)
plot(C(:,1),C(:,2),'kx','MarkerSize',12,'LineWidth',2)
plot(C(:,1),C(:,2),'kx','MarkerSize',12,'LineWidth',2)
%plot(C(:,1),C(:,2),'kx','MarkerSize',12,'LineWidth',2)

legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','NW')
C;
SumD;
