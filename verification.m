s = RandStream('mt19937ar','Seed','shuffle');

events = {'A','~A'};

total = 1000000; %总试验次数

step = 0.01; %概率步长

start = 0.005; %起始概率

cnt = 0; %用于计数

rst = [ ]; %存放各次结果

j = 0; %步长计数

psb = start:step:1;

while start+j*step<1

cnt = 0;

for i=1:total

result = randsample(s,events,1,true,[start+j*step 1-start-j*step]);

if strcmp(result,'A')

cnt = cnt + 1;

end

end

rst = [rst cnt];

j = j + 1;

end

varepsilon = abs(rst/total-psb);

plot(psb,varepsilon);

title("不同概率下的ε下限");

xlabel("成功概率p");

ylabel("ε下限");