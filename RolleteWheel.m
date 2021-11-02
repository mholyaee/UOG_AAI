function Parents=RolleteWheel(Fitness)
R=length(Fitness);
Parents=zeros(1,round(R/2));
%---------------------------
F1=1.+Fitness;
F2=1./F1;
%---------------------------
S=sum(F2);

 r=1;
while r<=round(R/2)
    p=rand(1);
    domain=0;
    i=1;
    while p>domain && i<=R
        domain=domain+F2(i)/S;
        i=i+1;
    end
    f=0;
    for j=1:r
        if Parents(j)==i-1
            f=1;
        end
    end
    if f==0
        Parents(r)=i-1;
        r=r+1;
    end
    
    
end

