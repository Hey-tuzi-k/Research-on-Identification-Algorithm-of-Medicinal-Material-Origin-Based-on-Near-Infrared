% % 一、基于密度的聚类算法的概述
% %     最近在Science上的一篇基于密度的聚类算法《Clustering by fast search and find of density peaks》引起了大家的关注(在我的博文“论文中的机器学习算法——基于密度峰值的聚类算法”中也进行了中文的描述)。于是我就想了解下基于密度的聚类算法，熟悉下基于密度的聚类算法与基于距离的聚类算法，如K-Means算法之间的区别。
% %     基于密度的聚类算法主要的目标是寻找被低密度区域分离的高密度区域。与基于距离的聚类算法不同的是，基于距离的聚类算法的聚类结果是球状的簇，而基于密度的聚类算法可以发现任意形状的聚类，这对于带有噪音点的数据起着重要的作用。
% % 二、DBSCAN算法的原理
% % 1、基本概念
% %     DBSCAN(Density-Based Spatial Clustering of Application with Noise)是一种典型的基于密度的聚类算法，在DBSCAN算法中将数据点分为一下三类：
% % 核心点。在半径Eps内含有超过MinPts数目的点
% % 边界点。在半径Eps内点的数量小于MinPts，但是落在核心点的邻域内
% % 噪音点。既不是核心点也不是边界点的点
% % 在这里有两个量，一个是半径Eps，另一个是指定的数目MinPts。
% %     一些其他的概念
% % Eps邻域。简单来讲就是与点的距离小于等于Eps的所有的点的集合，可以表示为。
% % 直接密度可达。如果在核心对象的Eps邻域内，则称对象从对象出发是直接密度可达的。
% % 密度可达。对于对象链：，是从关于Eps和MinPts直接密度可达的，则对象是从对象关于Eps和MinPts密度可达的。



function [class,type]=dbscan(x,k,Eps)
x=zscore(x);
[m,~]=size(x);  %得到数据的大小

if nargin<3||isempty(Eps)
   [Eps]=epsilon(x,k);                %  ??
end

x=[[1:m]',x];
[m,n]=size(x);      %重新计算数据集的大小
type=zeros(1,m);  %用于区分核心点1，边界点0和噪音点-1
no=1;                         %用于标记类
touched=zeros(m,1);  %用于判断该点是否处理过,0表示未处理过

%% 对每一个点进行处理
for i=1:m
    %找到未处理的点
    if touched(i)==0;
       ob=x(i,:);
       D=dist(ob(2:n),x(:,2:n));  %取得第i个点到其他所有点的距离
       ind=find(D<=Eps);            %找到半径Eps内的所有点
    
       %% 区分点的类型
       
       %边界点
       if length(ind)>1 && length(ind)<k+1    
          type(i)=0;
          class(i)=0;
          touched(i)=1;
       end
       
       %噪音点
       if length(ind)==1
          type(i)=-1;
          class(i)=-1;  
          touched(i)=1;
       end

       %核心点(此处是关键步骤)
       if length(ind)>=k+1; 
          type(i)=1;
          class(ind)=ones(length(ind),1)*max(no);
          touched(i)=1;
          
          % 判断核心点是否密度可达
          while ~isempty(ind)
                ob=x(ind(1),:);
                touched(ind(1))=1;
                ind(1)=[];
                D=dist(ob(2:n),x(:,2:n));  %找到与ind(1)之间的距离
                i1=find(D<=Eps);
     
                if length(i1)>1   %处理非噪音点
                   class(i1)=no;
                   if length(i1)>=k+1;
                      type(ob(1))=1;
                   else
                      type(ob(1))=0;
                   end

                   for k1=1:length(i1)
                       if touched(i1(k1))==0
                          touched(i1(k1))=1;
                          ind=[ind i1(k1)];   
                          class(i1(k1))=no;
                       end                    
                   end
                end
          end
          no=no+1; 
       end
   end
end
% 最后处理所有未分类的点为噪音点
i1=find(class==0);
class(i1)=-1;
type(i1)=-1;
maxlab=max(class);
clusteridx=[];
clun=[];
for ck=1:maxlab
    tidx=find(class==ck);
    clusteridx=[clusteridx;[tidx,zeros(1,m-length(tidx))]];
    clun=[clun,length(tidx)];
end
disp(clun);


