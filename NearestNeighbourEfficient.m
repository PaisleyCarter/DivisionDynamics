%Nearest neighbour set nn so the ith row of nn displays the nearest
%neighbours of cell i 
N=length(X);
[V,C] = voronoin(X);
DT = delaunayTriangulation(X);
nn=zeros(N-2);
SC = zeros(length(V),3);
count2 = 1;
CommonVert = zeros(N,N,2);
for i=1:N
    count = 1;
    for j=1:length(C)
        if j ~= i  
            M= ismember([C{i}], C{j});
            N= ismember(1, M);
            if N==1
                nn(i,count) = j;
                count = count + 1;
            end
        else 
            continue
        end
    
    end
    
    
    %For each cell find it's vertices and each vertex's surrounding 3 cells
    for j=1:length(C{i})
        vertex= C{i}(j);
        if vertex~=(X+1)
            SC(count2,:) = DT.ConnectivityList(vertex, :);
            count2 = count2 + 1;
        else
            SC(count2,1) = DT.ConnectivityList(vertex);
            count2 = count2 + 1;
        end
    end
    
    %For each cell i, what vertices does it have in common with neighbouring cell j~= i
    %Every cell will have only 2 vertices in common i.e the edge that
    %separates them
    for k=1:length(nn(i,:))
        if nn(i,k)~= 0 
            CommonVert(i,nn(i,k),:)= intersect(C{nn(i,k)}, C{i});
        else 
            continue
        end
    end 
    
end 