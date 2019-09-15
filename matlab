%输入判断矩阵，得出个指标权重以及一致性检验值
function boot=pr5(a)
[Row,Column]=size(a);%确定矩阵长宽
%求优先级算量
a2=zeros(1,Row);
tx=1;ty=1;n=1;
for ty=1:Row
    for tx=1:Row%计算行元素乘积
        n=n*a(ty,tx);
    end
    n=n^(1/Row);
    a2(1,ty)=n;%存放数据
    n=1;
end
a2
a3=a2/(sum(a2,2));%a3 是存放权重的向量


%I值
switch Row
    case 3
        RI=0.58;
    case 4
        RI=0.90;
    case 5
        RI=1.12;
    case 6
        RI=1.24;
    case 7
        RI=1.32;
    case 8
        RI=1.41;
    case 9
        RI=1.45;
    case 10
        RI=1.49;
    otherwise
end

%一致性检验
a3=a3';
KM=a*a3;
lambda_max=max(max((KM/a3)));
CI=(lambda_max-Row)/(Row-1);
CR=CI/RI;
if CR<0.1
    boot=0;
else
   boot=1;
end
return 
