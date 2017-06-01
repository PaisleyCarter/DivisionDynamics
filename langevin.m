function dr= langevin(t,r,v0,p,gradE)
dr = -gradE + v0*p
end 