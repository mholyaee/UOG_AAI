function  NewCHR=OrderOne(Parents,CHR,Pc,Eli,QNumber)
[R,C]=size(CHR);
NewCHR=zeros(R,C);
N=length(Parents)*2;

for n=1:2:N-Eli
    p1=0;
    while p1==0
        p1=round(rand(1)*N/2);% See line4
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
        while point2==0 || point1==point2
            point2=round(rand(1)*QNumber);
        end
        if point1>point2
            temp=point1;
            point1=point2;
            point2=temp;
        end
        c1=zeros(1,QNumber);
        c1(point1:point2)=parent1(point1:point2);
        indc=mod(point2,length(c1))+1;
        indp=mod(point2,length(c1))+1;
        i=1;
        flag=1;
        while i<=length(c1)-(point2-point1+1)
            if isempty(find(c1==parent2(indp)))==1
               c1(indc)=parent2(indp);
               indc=mod(indc,length(c1))+1;
               i=i+1;

            end
               indp=mod(indp,length(c1))+1;
               flag=flag+1;
               if flag>length(c1)*2
                   c1=parent1;
                   break;
               end
        end
        
        c2=zeros(1,QNumber);
        c2(point1:point2)=parent2(point1:point2);
        indc=mod(point2,length(c2))+1;
        indp=mod(point2,length(c2))+1;
        i=1;
        flag=1;
        while i<=length(c1)-(point2-point1+1)
            if isempty(find(c2==parent1(indp)))==1
               c2(indc)=parent1(indp);
               indc=mod(indc,length(c2))+1;
               i=i+1;
              
            end
            indp=mod(indp,length(c2))+1;
             flag=flag+1;
            if flag>length(c1)*2
                c2=parent2;
                break;
            end
        end
        %c1(point+1:QNumber)=parent2(point+1:QNumber);
        %c2(1:point)=parent2(1:point);
        %c2(point+1:QNumber)=parent1(point+1:QNumber);
    else
        c1=parent1;
        c2=parent2;
    end
    NewCHR(n,:)=c1;
    NewCHR(n+1,:)=c2;
    n

end

