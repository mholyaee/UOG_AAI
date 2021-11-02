function  NewCHR=SinglePoint2(Good,Bad,CHR,Pc,Eli,QNumber,nesbat)
[R,C]=size(CHR);
NewCHR=zeros(R,C);
N=round(R*(1-nesbat));
Parents=Good;
New1=zeros(N,C);
for n=1:2:N-Eli
    p1=0;
    while p1==0
        p1=round(rand(1)*length(Good));
    end
    p2=0;
    while p2==0 || p1==p2
        p2=round(rand(1)*length(Good));
    end
    p=rand(1);
    parent1=CHR(Parents(p1),:);
    parent2=CHR(Parents(p2),:);
    if p<=Pc
        point=0;
        while point==0
        point=round(rand(1)*QNumber);
        end
        c1(1:point)=parent1(1:point);
        c1(point+1:QNumber)=parent2(point+1:QNumber);
        c2(1:point)=parent2(1:point);
        c2(point+1:QNumber)=parent1(point+1:QNumber);
    else
        c1=parent1;
        c2=parent2;
    end
    New1(n,:)=c1;
    New1(n+1,:)=c2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% [R,C]=size(CHR);
%NewCHR=zeros(R,C);
N=round(R*(nesbat));
Parents=Bad;
New2=zeros(N,C);
for n=1:2:N
    p1=0;
    while p1==0
        p1=round(rand(1)*length(Bad));
    end
    p2=0;
    while p2==0 || p1==p2
        p2=round(rand(1)*length(Bad));
    end
    p=rand(1);
    parent1=CHR(Parents(p1),:);
    parent2=CHR(Parents(p2),:);
    if p<=Pc
        point=0;
        while point==0
        point=round(rand(1)*QNumber);
        end
        c1(1:point)=parent1(1:point);
        c1(point+1:QNumber)=parent2(point+1:QNumber);
        c2(1:point)=parent2(1:point);
        c2(point+1:QNumber)=parent1(point+1:QNumber);
    else
        c1=parent1;
        c2=parent2;
    end
    New2(n,:)=c1;
    New2(n+1,:)=c2;
end
NewCHR=[New1;New2];



