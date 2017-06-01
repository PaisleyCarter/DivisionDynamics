% Wound Healing

%Initialise system
n=50;
r=4*rand(50,2);
theta = 2*pi*rand(n,1);
[R,V,C] = ComputeVoronoiPBC(r);
[A,P] = CellPolyareaPerimeter(V,C);
PreferredAreaPerimeter =zeros(n,2);

%%Initialise variables
v0 = 0.1; %Cell motility speed
t = 0; %Initial time
dt = 0.01;%Time step
tmax = 1;%Final time
Dr = 0.01;%Diffusion coefficient
count=0;

for i=1:n
    PreferredAreaPerimeter(i,1) = mean(A(1:n,:));
    PreferredAreaPerimeter(i,2) = mean(P(1:n,:));
end 

%Create the hole/wound and output the cells which have been 'removed'
IN = CellPatch(r);

%Set the Area and Perimeter of wounded cells to be small

for j=1:length(IN)
    cell = IN(j);
    PreferredAreaPerimeter(cell,1) = 0.01;
    PreferredAreaPerimeter(cell,2) = 0.01;
end 

%Evolve the system as usual
while(t<tmax)
    count=count+1;
    patchSystem(r);
  
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

