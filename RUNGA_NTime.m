function [ BestOfEachRun,Iteration ] = RUNGA_NTime(n)
[average, best]=GA_8Queen( 200,80,0.9,0.1,4,3,0,20);
[R,C]=size(average);
BestOfEachRun=zeros(1,n);
BestOfEachRun(1,1)=best(1,C);
Iteration=zeros(1,n);
j=C;
while BestOfEachRun(1,1)==best(1,j)
    j=j-1;
end
Iteration(1,1)=j+1;
for i=2:n
    [average, best]=GA_8Queen( 200,80,0.9,0.1,4,3,0,20);
    BestOfEachRun(1,i)=best(1,C);
    j=C;
    while BestOfEachRun(1,i)==best(1,j)
        j=j-1;
    end
    Iteration(1,i)=j+1;
end
mean(BestOfEachRun)
mean(Iteration)

