r=4*rand(10,2);
N=length(r);
theta = 2*pi*rand(N,1);
[X,V,C] = ComputeVoronoiPBC(r);
originalpoints = r;

v0 = 0.1;
t = 0;
dt = 0.01;
tmax = 1;
Dr = 0.01;
count=0;
while(t<tmax)
    count=count+1;
    R=Periodicity3(r); %Update periodic boxes
    [vx,vy] = voronoi(R(:,1),R(:,2));
    fig=figure('units', 'normalized', 'outerposition', [0 0 1 1]);
    plot(vx,vy,'-b', r(:,1),r(:,2),'.r');
    xlim([-4,8]);
    ylim([-4,8]);
    saveas(fig,sprintf('celldynamics%d.jpg',count));
    close(fig)
    [V,C] = voronoin(R); %Re-tesselate 
    [A,P] = CellPolyareaPerimeter(V,C);%Calculate area and perimeter 
    gradE = zeros(N,2);
    eta = zeros(N,1);
    p = zeros(N,2);
    for i=1:N
        gradE(i,:) = EnergyGradient(i,R, N,V,C,A,P)
        eta(i) = sqrt(2*Dr)*randn();
        p(i,:) = [cos(theta(i)) sin(theta(i))];   
        r(i,:) = r(i,:) + dt*(v0*p(i,:) - gradE(i,:));
        theta(i) = wrapTo2Pi(theta(i) + dt*eta(i));
    end 
    t = t + dt;
end 


figure('units', 'normalized', 'outerposition', [0 0 1 1]);
R=Periodicity3(r);
[vx, vy] = voronoi(R(:,1),R(:,2));
[V,C]=voronoin(R);
plot(vx,vy, '-b', R(:,1),R(:,2),'.b');
hold on 
plot(originalpoints(:,1), originalpoints(:,2), '.r');
xlim([min(R(:,1)),max(R(:,1))])
ylim([min(R(:,2)),max(R(:,2))])
title=('After');
for i=1:length(r)
    Ci = ['Cell ',num2str(i)];
    text(r(i,1), r(i,2), Ci)
end 
