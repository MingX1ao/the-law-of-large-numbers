s = RandStream('mt19937ar', 'Seed ', 'shuffle ');

events = { 'A ', '~A '};

total = 1000000; %总试验次数

times = 10; %单次取的结果个数

rst =  [ ]; %记录试验结果，1表示A发生

allrst =  [ ]; %记录给定n的成功次数

p =  [ ];

for i=1:total

result = randsample(s,events,1,true, [0.5 0.5 ]);

if strcmp(result, 'A')

rst = [rst 1];

else rst = [rst 0];

end

end %生成全部结果

j = 1;

while times *j <=3500 %随机取n组不重复

choose = randperm(3500,times *j);

cnt = 0;

for i=1:times *j

if rst(choose(i))==1

cnt = cnt + 1;

end

end

allrst =  [allrst cnt ];

p =  [p 1-cnt/times/j *2 ];

j = j + 1;

end

x = 10:10:3500;

z = log10(100 *p);

plot(log10(x),z);

title( "相对误差随n的变化 ");

xlabel( "lgn ");

ylabel( "2+lg（相对误差） ");