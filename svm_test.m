function [ classfication ] = test( train,test )

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

F1=D1;


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

F2=D2;
 
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

 F3=D3;
 
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
    D4=[C;y1];
    C=D4;
end

 E3=D4;

  z=ones(40,1);
labelset1=z+12;   %第一个类数据和标号
z5=ones(20,1);
labelset2=z5+13;  %第二个类数据和标号
z4=ones(20,1);
labelset3=z4+14;  %第三个类数据和标号
 z1=ones(30,1);
 z2=ones(30,1); 
  z3=ones(10,1);
label1=z1+12;   %第一个类数据和标号
label2=z2+13;  %第二个类数据和标号
label3=z3+14;  %第三个类数据和标号

train=[F1(1:40,:);F2(1:20,:);F3(1:20,:)];%选取训练数据

train_group=[labelset1;labelset2;labelset3];%选取训练数据类别标识

test= E3(1:70,:);%选取测试数据

test_group=[label1;label2;label3];%选取测试数据类别标识

 %数据预处理，用matlab自带的mapminmax将训练集和测试集归一化处理[0,1]之间

%训练数据处理

[train,pstrain] = mapminmax(train');

% 将映射函数的范围参数分别置为0和1

pstrain.ymin = 0;

pstrain.ymax = 1;

% 对训练集进行[0,1]归一化

[train,pstrain] = mapminmax(train,pstrain);

% 测试数据处理

[test,pstest] = mapminmax(test');

% 将映射函数的范围参数分别置为0和1

pstest.ymin = 0;

pstest.ymax =1;

% 对测试集进行[0,1]归一化

[test,pstest] = mapminmax(test,pstest);

% 对训练集和测试集进行转置,以符合libsvm工具箱的数据格式要求

train = train';

test = test';

 

%寻找最优c和g

%粗略选择：c&g 的变化范围是 2^(-10),2^(-9),...,2^(10)

[bestacc,bestc,bestg] = SVMcgForClass(train_group,train,-10,10,-10,10);

%精细选择：c 的变化范围是 2^(-2),2^(-1.5),...,2^(4), g 的变化范围是 2^(-4),2^(-3.5),...,2^(4)

[bestacc,bestc,bestg] = SVMcgForClass(train_group,train,-2,4,-4,4,3,0.5,0.5,0.9);

 

%训练模型

cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg)];

model=svmtrain(train_group,train,cmd);

disp(cmd);

 

%测试分类

[predict_label, accuracy, dec_values]=svmpredict(test_group,test,model);

 

%打印测试分类结果

figure(1);

hold on;
plot(test_group,'o');
legend('实际测试集分类');
title('测试集的实际分类','FontSize',10);
figure(2);
hold on
plot(test_group,'o');

plot(predict_label,'r*');

legend('实际测试集分类','预测测试集分类');

title({'\bfSVM算法分类';'测试集的实际分类和预测分类图'},'FontSize',10);

end
