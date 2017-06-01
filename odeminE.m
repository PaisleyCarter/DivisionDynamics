function dEdPhi = odeminE(phi,E,i,r)

N=length(r);
R= Periodicity3(r);
delta=0.1;
[E1x, E1y] = EnergyGradient(i, R, N+1);
[E2x, E2y] = EnergyGradient(N+1,R,N+1);


dEdPhi = delta*sin(phi)*(E2x - E1x) + delta*cos(phi)*(E1y - E2y);
end



[phi, E] = ode45(@(phi,E) odeminE(phi,E,i,r), [0 Pi], 