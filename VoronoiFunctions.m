
N= 10; %Number of Cells in the system 
[X,V] = ComputeVoronoi(N);%Computes Voronoi diagram, cells and vertices for given N
nn = NearestNeighbours(X); %Find nearest neighbours of each cell 
SC = SurroundingCells(X); %Find the neighbouring cells for each vertex
CV = CommonVertices(X, nn); %Find the vertices in common between 2 neighbouring cells