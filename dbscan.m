% % һ�������ܶȵľ����㷨�ĸ���
% %     �����Science�ϵ�һƪ�����ܶȵľ����㷨��Clustering by fast search and find of density peaks�������˴�ҵĹ�ע(���ҵĲ��ġ������еĻ���ѧϰ�㷨���������ܶȷ�ֵ�ľ����㷨����Ҳ���������ĵ�����)�������Ҿ����˽��»����ܶȵľ����㷨����Ϥ�»����ܶȵľ����㷨����ھ���ľ����㷨����K-Means�㷨֮�������
% %     �����ܶȵľ����㷨��Ҫ��Ŀ����Ѱ�ұ����ܶ��������ĸ��ܶ���������ھ���ľ����㷨��ͬ���ǣ����ھ���ľ����㷨�ľ���������״�Ĵأ��������ܶȵľ����㷨���Է���������״�ľ��࣬����ڴ��������������������Ҫ�����á�
% % ����DBSCAN�㷨��ԭ��
% % 1����������
% %     DBSCAN(Density-Based Spatial Clustering of Application with Noise)��һ�ֵ��͵Ļ����ܶȵľ����㷨����DBSCAN�㷨�н����ݵ��Ϊһ�����ࣺ
% % ���ĵ㡣�ڰ뾶Eps�ں��г���MinPts��Ŀ�ĵ�
% % �߽�㡣�ڰ뾶Eps�ڵ������С��MinPts���������ں��ĵ��������
% % �����㡣�Ȳ��Ǻ��ĵ�Ҳ���Ǳ߽��ĵ�
% % ����������������һ���ǰ뾶Eps����һ����ָ������ĿMinPts��
% %     һЩ�����ĸ���
% % Eps���򡣼������������ľ���С�ڵ���Eps�����еĵ�ļ��ϣ����Ա�ʾΪ��
% % ֱ���ܶȿɴ����ں��Ķ����Eps�����ڣ���ƶ���Ӷ��������ֱ���ܶȿɴ�ġ�
% % �ܶȿɴ���ڶ����������Ǵӹ���Eps��MinPtsֱ���ܶȿɴ�ģ�������ǴӶ������Eps��MinPts�ܶȿɴ�ġ�



function [class,type]=dbscan(x,k,Eps)
x=zscore(x);
[m,~]=size(x);  %�õ����ݵĴ�С

if nargin<3||isempty(Eps)
   [Eps]=epsilon(x,k);                %  ??
end

x=[[1:m]',x];
[m,n]=size(x);      %���¼������ݼ��Ĵ�С
type=zeros(1,m);  %�������ֺ��ĵ�1���߽��0��������-1
no=1;                         %���ڱ����
touched=zeros(m,1);  %�����жϸõ��Ƿ����,0��ʾδ�����

%% ��ÿһ������д���
for i=1:m
    %�ҵ�δ����ĵ�
    if touched(i)==0;
       ob=x(i,:);
       D=dist(ob(2:n),x(:,2:n));  %ȡ�õ�i���㵽�������е�ľ���
       ind=find(D<=Eps);            %�ҵ��뾶Eps�ڵ����е�
    
       %% ���ֵ������
       
       %�߽��
       if length(ind)>1 && length(ind)<k+1    
          type(i)=0;
          class(i)=0;
          touched(i)=1;
       end
       
       %������
       if length(ind)==1
          type(i)=-1;
          class(i)=-1;  
          touched(i)=1;
       end

       %���ĵ�(�˴��ǹؼ�����)
       if length(ind)>=k+1; 
          type(i)=1;
          class(ind)=ones(length(ind),1)*max(no);
          touched(i)=1;
          
          % �жϺ��ĵ��Ƿ��ܶȿɴ�
          while ~isempty(ind)
                ob=x(ind(1),:);
                touched(ind(1))=1;
                ind(1)=[];
                D=dist(ob(2:n),x(:,2:n));  %�ҵ���ind(1)֮��ľ���
                i1=find(D<=Eps);
     
                if length(i1)>1   %�����������
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
% ���������δ����ĵ�Ϊ������
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


