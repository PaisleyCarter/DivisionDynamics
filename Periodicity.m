function R = Periodicity(r)

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
end 