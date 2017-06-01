function [R, V, C] = ComputeVoronoiPBC(r)

%This function outputs  the complete periodic
%cell system R, and the vertices V and cell centers C. 
R = Periodicity3(r);
N=length(r);
figure('units', 'normalized', 'outerposition', [0 0 1 1]);
[V,C] = voronoin(R);
[vx, vy] = voronoi(R(:,1),R(:,2));
plot(vx,vy, '-b', R(:,1),R(:,2),'.b');
%grid on
%set(gca, 'XTick', [-1,0,1], 'YTick', [-1,0,1], 'xcolor', 'r', 'ycolor', 'r', 'linewidth', 2)

xlim([min(R(:,1)),max(R(:,1))])
ylim([min(R(:,2)),max(R(:,2))])
title=('Before');

K= zeros(N,N-2);
for i=1:N
    for j=1:length(C{i})
        K(i,j) = C{i}(j);
    end
end


hold on 
%Labelling the cell numbers C_i
%for i=1:length(r)
   % Ci = ['Cell ',num2str(i)];
  %  text(r(i,1), r(i,2), Ci)
%end 

%Labelling vertex numbers v_i
%for i=1:length(V)
 %   text(V(i,1),V(i,2), num2str(i), 'HorizontalAlignment', 'Left')
%end 

end