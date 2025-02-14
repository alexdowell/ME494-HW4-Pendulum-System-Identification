% #1
load qube_data_multistep
time2 = data(1,:)';
volt2 = data(2,:)';
ang2 = data(3,:)';
vel2 = data(4,:)';
acc2 = deriv(vel2,.01);
N = length(time2);
bias = ones(N,1);
% x2 = [bias];
% x2 = [volt2];
% x2 = [ang2];
% x2 = [vel2];
% x2 = [bias, volt2];
% x2 = [bias, ang2];
% x2 = [bias, vel2];
% x2 = [ang2, vel2];
% x2 = [volt2, vel2];
% x2 = [ang2, volt2];
% x2 = [bias, volt2, ang2];
% x2 = [bias, volt2, vel2];
% x2 = [bias, ang2, vel2];
% x2 = [volt2, ang2, vel2];
% x2 = [volt2, ang2, vel2, bias];
x2 = [ones(N,1), volt2, ang2];
T_hat2 =(x2'*x2)\x2'*acc2;
Y_hat2 = x2*T_hat2;
disp('The p R squared value is:')
v2 = acc2 - Y_hat2;
R_sq2 = (T_hat2'*x2'*acc2 - length(acc2)*mean(acc2)^2) / (acc2'*acc2 - length(acc2) * mean(acc2)^2)
x2j = [ones(N,1), volt2, ang2, vel2];
T_hat2j =(x2j'*x2j)\x2j'*acc2;
Y_hat2j = x2j*T_hat2j;
disp('The pj R squared value is:')
v2j = acc2 - Y_hat2j;
R_sq2j = (T_hat2j'*x2j'*acc2 - length(acc2)*mean(acc2)^2) / (acc2'*acc2 - length(acc2) * mean(acc2)^2)
ssr = 0;
for i = 1:N
 ssr = ((Y_hat2(i) - mean(acc2))^2) + ssr;
end
ssrj = 0;
for i = 1:N
 ssrj = ((Y_hat2j(i) - mean(acc2))^2) + ssrj;
end
s_sq = sum(v2.^2)/(length(v2) -length(T_hat2));
disp('The f-statistic is:')
f = (ssr + ssrj) / s_sq
% #2
fmin = 0.1; % hz
fmax = 3.0; % hz
dt = .01; % s
T = 30; % s
amp = 3*3.14/180; % rad
% frequency sweep input/output %
[u,t,pf,f] = mksswp(amp,fmin,fmax,dt,T);
N = length(t);
[y,yd, ydd, u_cmd, t] = pend(u, dt, T);
% error %
e_kp = u-y;
e_ki = cumtrapz(T,e_kp);
e_kd = deriv(e_kp,dt);
% model %
x = [ones(N,1), e_kp, e_ki, e_kd];
T_hat = (x'*x)\x'*u_cmd
Y_hat = x*T_hat;
% coefficient of determination %
disp('The step input model validation using frequency sweep data R squared value is:')
R_sq = (T_hat'*x'*u_cmd - N*mean(u_cmd)^2) / (u_cmd'*u_cmd - N*mean(u_cmd)^2)
% Plot %
plot(t,u_cmd,t,Y_hat)
title('actual and modeled output (frequency sweep) vs. time')
xlabel('time (s)')
ylabel('voltage (V)')
legend('actual','modeled')
% #3
amp = 3.14/2;
tpulse = .5;
npulse = 1;
tdelay = 4.0;
dt = .01;
T = 10;
% Step-Input input/output %
[u2,t] = mksqw(amp,tpulse,npulse,tdelay,dt,T);
N = length(t);
u = lowpass(u2, .01);
[y, yd, ydd, u_cmd, t] = pend(u , dt, T);
% error %
e_kp = u - y;
e_ki = cumtrapz(T,e_kp);
e_kd = deriv(e_kp,dt);
% model %
x = [ones(N,1), e_kp, e_ki, e_kd];
T_hat = (x'*x)\x'*u_cmd
Y_hat = x*T_hat;
% coefficient of determination %
disp('The step input model validation using frequency sweep data R squared value is:')
R_sq = (T_hat'*x'*u_cmd - N*mean(u_cmd)^2) / (u_cmd'*u_cmd - N*mean(u_cmd)^2)
% Plot %
% plot(t, u2, t, u) % filtered and unfiltered step
plot(t, u_cmd, t, Y_hat)
title('actual and modeled output (step-input) vs. time')
xlabel('time (s)')
ylabel('voltage (V)')
legend('actual','modeled')