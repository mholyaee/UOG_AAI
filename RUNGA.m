function RUNGA()
%[method1_average, method1_best]=GA_8Queen( 200,80,0.9,0.1,1,3,0,30);
%[method2_average, method2_best]=GA_8Queen( 200,80,0.9,0.1,2,1,0,30);
[method3_average, method3_best]=GA_8Queen( 200,80,0.9,0.1,3,2,0,30);
% figure;
% plot(method1_average,'--rs','LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','g',...
%     'MarkerSize',6);
% hold all;
% plot(method2_average,'--bd','LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','b',...
%     'MarkerSize',6);
% plot(method3_average,'-.go','LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','c',...
%     'MarkerSize',6);
% xlabel('Iterations');
% ylabel('Fitness');
% title('Compare Selection methods');
% legend('roulette wheel','Ranking','Tournoment');
% hold off;
% figure;
% plot(method1_best,'--bd','LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','b',...
%     'MarkerSize',6);
% hold all;
% plot(method2_best,'-.go','LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','c',...
%     'MarkerSize',8);
% plot(method3_best,'-.k^','LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor','m',...
%     'MarkerSize',7);
% xlabel('Iterations');
% ylabel('Fitness');
% title('Compare Selection methods');
% legend('roulette wheel','Ranking','Tournoment');

 %legend('Average with Elitism','Best with Elitism','Average','Best ');
 %legend('Average with single point','Best with single point','Average with double point','Best with double point ');
end

