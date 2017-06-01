function E = EnergyGradient(cell,X, N)

[V,C] = voronoin(X);
[A,P] = CellPolyareaPerimeter(V,C);

E=zeros(1,2); %Initialise gradE as zero vector
nn = NearestNeighbourPBC(N,C);%Find nearest neighbours of cells
neighbours = nn(cell,:); %Identify the neighbours for given cell 
G=0;
L=0;

%Calculating E1 which is mu=x
for j=1:length(neighbours) 
    J = neighbours(j); %Take each neighbour of cell
    CV = CommonVerticesPBC(N,V,C,nn); 
    if J == 0
        continue 
    else 
        h = CV(cell,J,:); %for a non-zero neighbour, take the 2 vertices it has in common with chosen cell
        for i=1:2
            k = h(i); %For each vertex 
            [E1x, E1y] = partialEnergy(A,P,J, k, V,C,N);
            H= partialVertex(cell,k,X,V);
            G = G + E1x*H(1,1) + E1y*H(1,2);
            L = L + E1x*H(2,1) + E1y*H(2,2);
        end
    end 
end 
%Calculating E2 which is mu=y
F=0;
M=0;
HH=0;
vertices=C{cell};
for i=1:length(vertices)
    l = vertices(i);
    [E2x,E2y] = partialEnergy(A,P,cell,l,V,C,N);
    HH = partialVertex(cell,l,X,V);
    F= F+ E2x*HH(1,1) + E2y*HH(1,2);
    M = M + E2x*HH(2,1) + E2y*HH(2,2);
end 
E(1)= G - F;
E(2) = L-M;
end 