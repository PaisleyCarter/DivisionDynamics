N = 30
r = 5.*rand(N,2)   %simulate cell points
theta = 2*pi*rand(N,1)  %polarity angle

figure('units', 'normalized', 'outerposition', [0 0 1 1]);
[v,c] = voronoin(r);
[vx, vy] = voronoi(r(:,1),r(:,2));
plot(vx,vy, '-r', r(:,1),r(:,2),'.r');
xlim([min(r(:,1)),max(r(:,1))])
ylim([min(r(:,2)),max(r(:,2))])
title=('Before');
hold on

v0 = 2;
t = 0;
dt = 0.01;
tmax = 2;
Ka = 1;
Kp= 1;
Dr = 1.1;
A0= 0.5;
P0= 0.5;
A=zeros(N,1);
P=zeros(N,1);
E=zeros(N,1);

for i=1:N
    z = length(c{i});
    for m=1:(z-1)
        P(i) = P(i) + norm((v(c{i}(m),:) - v(c{i}(m+1),:))); %Calculating the perimeter of cell i 
    end 
    P(i) = P(i) + norm(v(c{i}(z),:)-v(c{i}(1),:));
    v(c{i}(z),3)=0;
    for m=1:(z-1)
        A(i) = A(i) + 0.5*norm(cross(v(c{i}(m),:),v(c{i}(m+1),:)));
    end
    A(i) = A(i) + 0.5*norm(cross(v(c{i}(z),:), v(c{i}(1),:)));
    E(i)= Ka*(A(i)-A0)^2 + Kp*(P(i)-P0)^2;
end 


while(t<tmax)
    for i=1:N
        gradE = zeros(1,2);
        dEidr = 
        %Find nearest neighbours of cell i and put them in n.n
        for j in n.n(i)
            %Find vertices h1 and h2 that cell i and j have in common
            dEdr= dEdr + dEdh1*dh1dr + dEdh2*dh2*dr
            
            dEdh1(j) = 2*Ka*(A(j)-A(0))*dAdh1 + 2*Kp*(P(j)-P(0))*dPdh1
            

        end
        gradE = dEdr - dEidr
        eta = sqrt(2*Dr)*randn();
        p = [cos(theta(i)), sin(theta(i))];
        r(i,:) = r(i,:) + dt*(v0*p - gradE);
        theta(i) = theta(i) + dt*eta;
        t = t + dt;
    end 
    
    
end

disp(r)
disp(theta)
[v,c] = voronoin(r);
[vx, vy] = voronoi(r(:,1),r(:,2));
plot(vx,vy, '-c', r(:,1),r(:,2),'.c');
title=('After');
