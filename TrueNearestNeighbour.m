function nn = NearestNeighbours(X)
%Nearest neighbour set nn so the ith row of nn displays the nearest
%neighbours of cell i 

%Finding actual neighbours by testing whether they have more than one
%vertex in common
N=length(X);
[V,C] = voronoin(X);
DT = delaunayTriangulation(X);
nn=zeros(N-2);
for i=1:N
    count = 1;
    for j=1:length(C)
        if j ~= i  
            M= intersect(C{i}, C{j});
            L= length(M);
            if L>1
                nn(i,count) = j;
                count = count + 1;
            end
        else 
            continue
        end
    
    end
end