function [ classfication ] = test( train,test )

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

F1=D1;


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

F2=D2;
 
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

 F3=D3;
 
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
    D4=[C;y1];
    C=D4;
end

 E3=D4;

  z=ones(40,1);
labelset1=z+12;   %��һ�������ݺͱ��
z5=ones(20,1);
labelset2=z5+13;  %�ڶ��������ݺͱ��
z4=ones(20,1);
labelset3=z4+14;  %�����������ݺͱ��
 z1=ones(30,1);
 z2=ones(30,1); 
  z3=ones(10,1);
label1=z1+12;   %��һ�������ݺͱ��
label2=z2+13;  %�ڶ��������ݺͱ��
label3=z3+14;  %�����������ݺͱ��

train=[F1(1:40,:);F2(1:20,:);F3(1:20,:)];%ѡȡѵ������

train_group=[labelset1;labelset2;labelset3];%ѡȡѵ����������ʶ

test= E3(1:70,:);%ѡȡ��������

test_group=[label1;label2;label3];%ѡȡ������������ʶ

 %����Ԥ������matlab�Դ���mapminmax��ѵ�����Ͳ��Լ���һ������[0,1]֮��

%ѵ�����ݴ���

[train,pstrain] = mapminmax(train');

% ��ӳ�亯���ķ�Χ�����ֱ���Ϊ0��1

pstrain.ymin = 0;

pstrain.ymax = 1;

% ��ѵ��������[0,1]��һ��

[train,pstrain] = mapminmax(train,pstrain);

% �������ݴ���

[test,pstest] = mapminmax(test');

% ��ӳ�亯���ķ�Χ�����ֱ���Ϊ0��1

pstest.ymin = 0;

pstest.ymax =1;

% �Բ��Լ�����[0,1]��һ��

[test,pstest] = mapminmax(test,pstest);

% ��ѵ�����Ͳ��Լ�����ת��,�Է���libsvm����������ݸ�ʽҪ��

train = train';

test = test';

 

%Ѱ������c��g

%����ѡ��c&g �ı仯��Χ�� 2^(-10),2^(-9),...,2^(10)

[bestacc,bestc,bestg] = SVMcgForClass(train_group,train,-10,10,-10,10);

%��ϸѡ��c �ı仯��Χ�� 2^(-2),2^(-1.5),...,2^(4), g �ı仯��Χ�� 2^(-4),2^(-3.5),...,2^(4)

[bestacc,bestc,bestg] = SVMcgForClass(train_group,train,-2,4,-4,4,3,0.5,0.5,0.9);

 

%ѵ��ģ��

cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg)];

model=svmtrain(train_group,train,cmd);

disp(cmd);

 

%���Է���

[predict_label, accuracy, dec_values]=svmpredict(test_group,test,model);

 

%��ӡ���Է�����

figure(1);

hold on;
plot(test_group,'o');
legend('ʵ�ʲ��Լ�����');
title('���Լ���ʵ�ʷ���','FontSize',10);
figure(2);
hold on
plot(test_group,'o');

plot(predict_label,'r*');

legend('ʵ�ʲ��Լ�����','Ԥ����Լ�����');

title({'\bfSVM�㷨����';'���Լ���ʵ�ʷ����Ԥ�����ͼ'},'FontSize',10);

end
