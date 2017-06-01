%%Cell evolution: movement/fluctuations and division

%%First choose the size of the simulation box
L=4; 
N=15; %Number of cells
%%Randomly generate the initial cell centres and orientations
r=L*rand(N,2);
originalpoints = r;
theta = 2*pi*rand(N,1);
[X,V,C] = ComputeVoronoiPBC(r);

%%Initialise variables
v0 = 0.1; %Cell motility speed
t = 0; %Initial time
dt = 0.01;%Time step
tmax = 1;%Final time
Dr = 0.01;%Diffusion coefficient
count=0;



    count=count+1;
    R=Periodicity3(r); %Update periodic boxes
    [V,C] = voronoin(R); %Re-tesselate 
    [A,P] = CellPolyareaPerimeter(V,C);%Calculate area and perimeter 
    %Initialise variables
    gradE = zeros(N,2);
    p = zeros(N,2);
    %Cell Evolution: for each cell in the system
    for i=1:N
        gradE(i,:) = EnergyGradient(i,R, N); %Minimising energy
        p(i,:) = [cos(theta(i)) sin(theta(i))]; %Cell polarity   
    end 
    %r(i,:) = r(i,:) + dt*(v0*p - gradE);
    
y= theta;
[t,theta] = ode45(@odetheta, [t t+dt], y);
theta =wrapTo2Pi(theta);
r0=r;
[t,r] = ode45(@(t,r) odefcn(t,r,p,gradE), [0 1], r0);

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
