function Fitness=Set_Fitness(CHR,QNumber)
N=length(CHR);
Fitness=zeros(1,N);
for n=1:N
    temp=CHR(n,:);
    for i=1:QNumber-1
        for j=i+1:QNumber
            if(temp(i)==temp(j))
                Fitness(n)=Fitness(n)+1;
            end
        end
        %i1=i+1;
        j=i+1;
        for k=temp(i)+1:QNumber
            
            if(j<=QNumber &&k==temp(j))
                Fitness(n)=Fitness(n)+1;
            end
            j=j+1;
        end
        j=i+1;
        for k=temp(i)-1:-1:1
            
            if(j<=QNumber &&k==temp(j))
                Fitness(n)=Fitness(n)+1;
            end
            j=j+1;
        end
        
    end
end
end

