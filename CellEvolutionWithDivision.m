%%Cell evolution: movement/fluctuations and division

%%First choose the size of the simulation box
L=4; 
N=15; %Number of cells
%%Randomly generate the initial cell centres and orientations
r=L*rand(N,2);
originalpoints = r;
theta = 2*pi*rand(N,1);
[R,V,C] = ComputeVoronoiPBC(r);

%%Initialise variables
v0 = 0.1; %Cell motility speed
t = 0; %Initial time
dt = 0.01;%Time step
tmax = 1;%Final time
Dr = 0.01;%Diffusion coefficient
count=0;



while(t<tmax)
    count=count+1;
    R= Periodicity3(r);
    plotsystem(r,R,count);
    
    [r,theta] = CellDivision(r,theta);
    count=count+1;
    [R,V,C,A,P] = UpdateTesselate(r,count);
    %[r,theta] = CellDeath(r,theta);
    %count=count+1;
    %[R,V,C,A,P] = UpdateTesselate(r,count);
     N=length(r);
  
    gradE = zeros(N,2);
    eta = zeros(N,1);
    p = zeros(N,2);
    for i=1:N
        gradE(i,:) = EnergyGradient(i,R, N);
        eta(i) = sqrt(2*Dr)*randn();
        p(i,:) = [cos(theta(i)) sin(theta(i))];   
        r(i,:) = r(i,:) + dt*(v0*p(i,:) - gradE(i,:));
        theta(i) = wrapTo2Pi(theta(i) + dt*eta(i));
    end 
    t = t + dt;
end 
