function [x,y] = partialEnergy(A,P,cell,vertex,V,C,n)
%Calculate dE/dh
[Ax, Ay] = partialArea(cell,vertex,V,C); 
[Px,Py] = partialPerimeter(cell,vertex,V,C);

Ka=0.1;
Kp=0.1;
A0= mean(A(1:n,:));
P0= mean(P(1:n,:));

x= 2*Ka*(A(cell)-A0)*Ax + 2*Kp*(P(cell)-P0)*Px; %dE/dh(x)
y= 2*Ka*(A(cell)-A0)*Ay + 2*Kp*(P(cell)-P0)*Py; %dE/dh(y)
end 