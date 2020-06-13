% strange attractor chaos
clc
close all
clear
sig = 10;b=8/3;r=28;

f = @(t,y) [sig*(y(2)-y(1));r*y(1)-y(2)-y(1)*y(3);y(1)*y(2)-b*y(3)];

in_pt = [0,1,0];

[ts,ys] = ode45(f,[0,100],[in_pt(1),in_pt(2),in_pt(3)]);
figure
plot(ts,ys(:,2),'r')
xlabel('t')
ylabel('y')
title('aperidoc oscs')


figure
plot(ys(:,1),ys(:,3),'r')
xlabel('x')
ylabel('z')
title('lorenz butterfly')


