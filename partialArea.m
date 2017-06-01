function [x,y] = partialArea(cell, vertex, V,C)
%This function calculates dA(j)/dh(mu) where j is the cell index, mu is
%the cartesian coordinate index and h is one of the 2 vertices in common
%with cell i.

%Find position of vertex in list of cell vertices 
p = find(C{cell}==vertex);
l=length(C{cell});
if p==1
    vertexR = p+1;
    vertexL = l;
elseif p==l
    vertexR = 1;
    vertexL = p-1;
else 
    vertexR = p+1;
    vertexL = p-1;
end 

%Label the vertices before and after vertex
R= C{cell}(vertexR);
L=C{cell}(vertexL);

x = 0.5*norm(V(R,2) - V(L,2)); %dA\dh(x)
y = 0.5*norm(V(L,1)- V(R, 1)); %dA\dh(y)
end 