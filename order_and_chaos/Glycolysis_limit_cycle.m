clc
close all
clear 

% example 7.3.3 simulating the glycolytic oscillator with a limit cycle
a = 0.08;b = 0.6;

%ode45 will be used to simulate

f = @(t,y) [-y(1)+a*y(2)+y(1).^2*y(2); b - a*y(2)-y(1).^2*y(2)];
 
in_pt = [1,0;-0.5,1.7;1,3;b, b/(a+b^2)+0.2];
figure
xlabel('x')
ylabel('y')
title('glycolytic oscillator')

grid on
hold on
for ii = 1:length(in_pt)
    
[ts,ys] = ode45(f,[0,100],[in_pt(ii,1),in_pt(ii,2)]);
plot(ys(:,1),ys(:,2))
plot(ys(1,1),ys(1,2),'bo') % starting point
plot(ys(end,1),ys(end,2),'ks') % ending point


end
hold off