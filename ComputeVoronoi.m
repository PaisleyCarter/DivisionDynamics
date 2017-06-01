function [X,V] = ComputeVoronoi(N)
X = rand(N,2);
[V,C] = voronoin(X);
K= zeros(N,N-2);
for i=1:N
    for j=1:length(C{i})
        K(i,j) = C{i}(j);
    end
end
DT = delaunayTriangulation(X);
voronoi(DT)

hold on 
xlim([-1.2 1.2])
ylim([-1.2 1.2])
%Labelling the cell numbers C_i
for i=1:length(X)
    Ci = ['Cell ',num2str(i)];
    text(X(i,1), X(i,2), Ci)
end 

%Labelling vertex numbers v_i
for i=1:length(V)
    
    text(V(i,1),V(i,2), num2str(i), 'HorizontalAlignment', 'Left')
end 
end