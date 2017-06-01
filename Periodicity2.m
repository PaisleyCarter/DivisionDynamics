function R = Periodicity2(r)

m=min(r(:,1));
n=min(r(:,2));
Minimum = floor(min(m,n));
o= max(r(:,1));
p=max(r(:,2));
Maximum = ceil(max(o,p));
diff = Maximum- Minimum;

rr = r; %copy of box to the right
rr(:,1) = r(:,1) + diff;
rl = r; %copy of box to the left
rl(:,1) = r(:,1) - diff;
ru = r; %copy of box above
ru(:,2) = r(:,2)+ diff;
rul = ru; %copy of box above to the left
rul(:,1) = ru(:,1) - diff;
rur = ru; %copy of box above to the right
rur(:,1) = ru(:,1) + diff;
rb = r; %copy of box below
rb(:,2) = r(:,2) - diff; 
rbl = rb; %copy of box below to the left
rbl(:,1) = rb(:,1) -diff;
rbr = rb; %copy of box below to the right
rbr(:,1) = rb(:,1) + diff;
R = vertcat(r,rr,rl); %combine the coordinates together in one vector
R = vertcat(R,ru, rul, rur, rb, rbr, rbl);
R=unique(R,'rows','stable');
end 