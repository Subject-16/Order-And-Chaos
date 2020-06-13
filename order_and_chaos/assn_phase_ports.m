%quiver plots for O and C assignments
close all
clear
clc
%dipole field
[x,y] = meshgrid(-1:0.1:1,-1:0.1:1);
u     = (2*x.*y);% x derivative
v     = y.^2-x.^2;% y derivative
%normalising the vector field arrows 
u     = u./(sqrt(u.^2+v.^2));
v     = v./(sqrt(u.^2+v.^2));
figure
quiver(x,y,u,v,'r')
xlabel('x')
ylabel('y')
title('Dipole')

%two eyed monster
[x,y] = meshgrid(-3:0.1:2,-2:0.1:2);
u     = y+y.^2;% x derivative
v     = -0.5*x+0.2*y - x.*y + 6/5*y.^2;% y derivative
%normalising the vector field arrows 
u     = u./(sqrt(u.^2+v.^2));
v     = v./(sqrt(u.^2+v.^2));
figure
quiver(x,y,u,v,'r')
xlabel('x')
ylabel('y')
title('2 eyed monster')
%strange attractor note minimal set
