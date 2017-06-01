function gradE = Gradient(r)
N=length(r);
R=Periodicity3(r);
gradE = zeros(N,2);
for i=1:N
        gradE(i,:) = EnergyGradient(i,R, N); 
end 
end 