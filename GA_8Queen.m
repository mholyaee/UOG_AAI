function [Average,Best ] = GA_8Queen( N,I,Pc,Pm,SelectMethod,CrossoverMethod,Elitism_number,QNumber )
%This function is represented to solve 8 Queen problem based on GA
%N=Population size
%I=Number of generations
%Pc=Crossover probability
%Pm=Mutation Probability
%Selection Method{0:Rollette Wheel, 1:Rank  2:Tournoment}
%Crossover Method {0: SinglePoint, 1:DoublePoint}
%Elitism_number
%Mohammad Olyaee mh.olyaee@znu.ac.ir 2011
%**********************************************************************
%Produce First generation randomly
%clc;
CHR=zeros(N,QNumber);
for i=1:N
%     for j=1:QNumber
%         temp=round(rand(1)*QNumber);
%         while(temp==0 || isempty(find(CHR(i,:)==temp)==0))
%             temp=round(rand(1)*QNumber);
%         end
        CHR(i,:)=randperm(QNumber);
%     end
end
%***********************************************************************
Fitness=zeros(1,N);
Best=zeros(1,I);
Average=zeros(1,I);
BestCHR=zeros(I,QNumber);
for i=1:I
    Fitness=Set_Fitness(CHR,QNumber);% Compute fitness values
    Best(1,i)=min(Fitness); % Find the best score in population
    index=find(Fitness==Best(1,i),1,'first');% Find who is the best
    BestCHR(i,:)=CHR(index,:);% save the best in each generation
    Average(1,i)=mean(Fitness); % Compute the average of populations' score
    %Crossover
    CHR=New_Gen(CHR,Pc,SelectMethod,CrossoverMethod,Fitness,Elitism_number,QNumber);
    %Mutation
    CHR=Mutation_8Queen(CHR,Pm);
end
figure;
plot(Average,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',3);
hold all;
plot(Best,'--bs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',3);
xlabel('Iterations');
ylabel('Fitness');
legend('Average','Best');
 BestCHR(I,:);
%hold off;


