function dthetadt = odetheta(t,theta)
Dr=0.01;
eta = sqrt(2*Dr)*rand(10,1); %Noise
dthetadt= eta;
