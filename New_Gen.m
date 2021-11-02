function NewCHR=New_Gen(CHR,Pc,SelectMethod,CrossoverMethod,Fitness,Eli,QNumber)
if(SelectMethod==1)
    Parents=RolleteWheel(Fitness);
elseif(SelectMethod==2)
    Parents=Rank(Fitness);
elseif (SelectMethod==3) 
    nts=length(CHR)/10;
    if nts>15
        nts=15;
    end
    Parents=Tournoment(Fitness,nts);
else
    nesbat=0.2;
    [Good,Bad]=ClassifiyParents(Fitness,nesbat);
end
if(CrossoverMethod==1)
    NewCHR=SinglePoint(Parents,CHR,Pc,Eli,QNumber);
elseif(CrossoverMethod==2)
    NewCHR=TwoPoint(Parents,CHR,Pc,Eli,QNumber);
elseif(CrossoverMethod==3)
    NewCHR=OrderOne(Parents,CHR,Pc,Eli,QNumber);
else
    NewCHR=SinglePoint2(Good,Bad,CHR,Pc,Eli,QNumber,nesbat);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Elitism%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if Eli >0 % product new population with elitism
   [R1,C1]=size(CHR);
   k=R1-Eli+1;
   %Elitism_number=round(R1/10);% entekhab 10% be onvane nokhbe
   sorted_fitness=sort(Fitness);
   index=zeros(1,Eli);
   for i=1:Eli
       find=0;
       for j=1:length(Fitness)
           if sorted_fitness(i)==Fitness(j) && find==0
               find=1;
               index(i)=j;
               NewCHR(k,:)=CHR(j,:);% ezafe kardane nokhbe ha be nasle jadid
               k=k+1;
               Fitness(j)=-1;
           end
       end
   end
   
end
