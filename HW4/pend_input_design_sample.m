% Pend Input Design Exercise %

clear all
close all

% Purpose is to create input designs, run simulations, and perform OLS

% Example of how to use the SIDPAC freq sweep generator. These numbers are
% bad for the homework problem, please dont simply use them as is.

fmin = 0.1; %Hz
fmax = 1.0;   %Hz
dt = 0.01; %s
tfinal = 10; %s
Amp = 3*3.14/180; %Radians
[ydes,t,pf,f] = mksswp(Amp,fmin,fmax,dt,tfinal); % Creates frequency sweep 




% Run simulation
[y,yd, ydd, u_cmd, t] = pend(ydes, dt, tfinal);

figure
subplot(4,1,1)
plot(t,ydd*180/3.14, 'linewidth',2)
xlabel('Time, s')
ylabel('Ang. Accel, deg/s^2')
subplot(4,1,2)
plot(t,yd*180/3.14, 'linewidth',2)
xlabel('Time, s')
ylabel('Ang. Vel, deg/s')
subplot(4,1,3)
plot(t,y*180/3.14, t,ydes*180/3.14, 'r', 'linewidth',2)
legend('Measured', 'Desired')
xlabel('Time, s')
ylabel('Angle, deg')
subplot(4,1,4)
plot(t, u_cmd, 'linewidth',2)
xlabel('Time, s')
ylabel('Motor Cmd, N-m')




