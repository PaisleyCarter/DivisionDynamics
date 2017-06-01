% Is this how you generate your Voronoi diagram?
x = gallery('uniformdata',[1 10],0);
y = gallery('uniformdata',[1 10],1);
dt = DelaunayTri(x(:),y(:));
[v,p] = voronoiDiagram(dt);

% Original colors of your Voronoi patches (mx3 matrix)
origColors = rand(numel(p), 3);

% To store handles to the generated patches
pHandle = nan(1, numel(p));

for i = 1:numel(p)
    if all(p{i}~=1)
        pHandle(i) = patch(v(p{i},1), v(p{i},2), color(i)); 
    end
end
set(gca, 'CLim', [0 7]);

% New colors for the patches (mx3 matrix)
newColors = rand(numel(p), 3);

% Recolor the closed regions
closedIdx = find(~isnan(pHandle));
arrayfun(@(i) set(pHandle(i), 'FaceColor', color(i,:)), closedIdx);
set(gca, 'CLim', [0 7]);