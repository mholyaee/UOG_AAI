function Parents=Tournoment(Fitness,nts)
R=length(Fitness);
Parents=zeros(1,round(R/2));

 r=1;
while r<=round(R/2)
    U=round(rand(1,nts)*R);% Index Of runners!
    for u=1:length(U)
        if U(u)==0
            U(u)=1;
        end
    end
    %---------------------------------
    fit=zeros(1,length(U));
    for f=1:length(U)
        fit(f)=Fitness(U(f));% Fit of runners!
    end
    Min_fit=min(fit);
    for f=1:length(U)
        if Min_fit==fit(f)
            Winner=U(f);%Index of winner!
        end
    end
            
    f=0;
    for j=1:r
        if Parents(j)==Winner
            f=1;
        end
    end
    if f==0
        Parents(r)=Winner;
        r=r+1;
    end
    
    
end


end