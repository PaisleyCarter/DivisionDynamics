function [A,P] = CellPolyareaPerimeter(V,C)

%Calculating the cell area and perimeter of cells in a voronoi tesselation
%with cell centers C and vertices V using POLYAREA

%Initialise
n=length(C);
A=zeros(n,1);
P=zeros(n,1);

for i=1:n
    z = length(C{i});
    X=zeros(z,1);
    Y=zeros(z,1);
    for j=1:z
        X(j) = V(C{i}(j),1);
        Y(j)= V(C{i}(j),2);
    end
    for m=1:(z-1)
        D=V(C{i}(m),:);
        E=V(C{i}(m+1),:);
        P(i) = P(i) + norm(D - E); %Calculating the perimeter of cell i 
    end 
    P(i) = P(i) + norm(V(C{i}(z),:)-V(C{i}(1),:));
    A(i) = polyarea(X,Y); %Calculating cell area
end 
