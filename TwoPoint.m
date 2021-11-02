function  NewCHR=TwoPoint(Parents,CHR,Pc,Eli,QNumber)
[R,C]=size(CHR);
NewCHR=zeros(R,C);
N=length(Parents)*2;

for n=1:2:N-Eli
    p1=0;
    while p1==0
        p1=round(rand(1)*N/2);
    end
    p2=0;
    while p2==0 || p1==p2
        p2=round(rand(1)*N/2);
    end
    p=rand(1);
    parent1=CHR(Parents(p1),:);
    parent2=CHR(Parents(p2),:);
    if p<=Pc
        point1=0;
        while point1==0
        point1=round(rand(1)*QNumber);
        end
        point2=0;
        while point2==0 ||point2<point1
        point2=round(rand(1)*QNumber);
        end
        c1(1:point1)=parent1(1:point1);
        c1(point1+1:point2)=parent2(point1+1:point2);
        c1(point2+1:QNumber)=parent1(point2+1:QNumber);
        c2(1:point1)=parent2(1:point1);
        c2(point1+1:point2)=parent1(point1+1:point2);
        c2(point2+1:QNumber)=parent2(point2+1:QNumber);
        
    else
        c1=parent1;
        c2=parent2;
    end
    NewCHR(n,:)=c1;
    NewCHR(n+1,:)=c2;
    

end

