function [Good,Bad]=ClassifiyParents(fchr,nesbat)
n1=round(length(fchr)*nesbat);
n2=length(fchr)-n1;
Good=zeros(1,n1);
Bad=zeros(1,n2);
copy=fchr;
copy=sort(copy);
L=length(fchr);
for l=1:L
    for i=1:L
        if copy(l)==fchr(i)
            Rank(l)=i;
            fchr(i)=-1;
            break;
        end
    end
end

Good=Rank(1:n1);
Bad=Rank(n1+1:L);
end
