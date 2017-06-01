function [vx,vy] = plotsystem(r,R,count)

[vx,vy] = voronoi(R(:,1),R(:,2));
fig=figure('units', 'normalized', 'outerposition', [0 0 1 1]);
plot(vx,vy,'-b', r(:,1),r(:,2),'.r');
xlim([-1,5]);
ylim([-1,5]);
saveas(fig,sprintf('celldivision%d.jpg',count));


end 