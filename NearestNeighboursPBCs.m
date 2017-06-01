%Implementing periodic boundary conditions
N=10;
r= rand(N,2); %single cell of interest *(box)
rr = r; %copy of box to the right
rr(:,1) = r(:,1) + 1;
rl = r; %copy of box to the left
rl(:,1) = r(:,1) - 1;
ru = r; %copy of box above
ru(:,2) = r(:,2)+1;
rul = ru; %copy of box above to the left
rul(:,1) = ru(:,1) - 1;
rur = ru; %copy of box above to the right
rur(:,1) = ru(:,1) + 1;
rb = r; %copy of box below
rb(:,2) = r(:,2) - 1; 
rbl = rb; %copy of box below to the left
rbl(:,1) = rb(:,1) -1;
rbr = rb; %copy of box below to the right
rbr(:,1) = rb(:,1) + 1;
R = vertcat(r,rr,rl); %combine the coordinates together in one vector
R = vertcat(R,ru, rul, rur, rb, rbr, rbl);



figure('units', 'normalized', 'outerposition', [0 0 1 1]);
[V,C] = voronoin(R);
[vx, vy] = voronoi(R(:,1),R(:,2));
plot(vx,vy, '-b', R(:,1),R(:,2),'.b', r(:,1), r(:,2),'+r');
grid on
set(gca, 'XTick', [-1,0,1], 'YTick', [-1,0,1], 'xcolor', 'r', 'ycolor', 'r', 'linewidth', 3)

xlim([min(R(:,1)),max(R(:,1))])
ylim([min(R(:,2)),max(R(:,2))])


%Finding list of nearest neighbours for each cell
for i=1:20
    cell=i;
    D= sprintf('neighbours for cell %d are', cell);
    disp(D)
    for j=1:length(C)
        if j ~= i  
            M= ismember([C{i}], C{j});
            N= ismember(1, M);
            if N==1
                disp(j)
            end
        else 
            continue
        end
    end
end 

%Displaying the contents of C{i}
for i=1:length(r), disp(C{i}), end

%Find the delaunay triangulation of the inital box of cells only
DT = delaunayTriangulation(R)

%Now finding the 3 cells surrounding vertex V
for i=1:length(r)
    disp(C{i})
    for j=1:length(C{i})
        vertex= C{i}(j);
        SC= sprintf('Surrounding cells of vertex %d are cells ', vertex);
        disp(SC)
        DT.ConnectivityList(vertex,:) %surrounding cells
    end
end



