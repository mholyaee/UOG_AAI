function CHR=Mutation_8Queen(CHR,Pm)
[R,C]=size(CHR);
for r=1:R
    gene=0;
    while(gene==0)
        gene=round(rand(1)*C);
    end
    p=rand(1);
    if p<=Pm
        newVal=0;
        while newVal==0
        newVal=round(rand(1)*8);
        end
        CHR(r,gene)=newVal;
    end
end

