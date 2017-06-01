function drdt = odefcn(t,r,p,gradE)
drdt = p - gradE;

