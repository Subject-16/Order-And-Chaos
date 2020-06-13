clc
close all
clear 
%logistic map sims also indicate the cycle periods ie after how many iters
%cycle repeats
N  = 50;%no. of iterations
x0 = 0.1;%starting point
x  = zeros(1,length(N));x(1) = x0;
r  = [1.8,3.3,3.5];

for ii=1:N-1
    x(ii+1) =  r(1)*x(ii)*(1-x(ii));
end

figure
plot(1:N,x,'r')
xlabel('n');
ylabel('x_n');
title('r = 1.8')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:N-1
    x(ii+1) =  r(2)*x(ii)*(1-x(ii));
end

figure
plot(1:N,x,'r')
xlabel('n');
ylabel('x_n');
title('r = 3.3')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:N-1
    x(ii+1) =  r(3)*x(ii)*(1-x(ii));
end

figure
plot(1:N,x,'r')
xlabel('n');
ylabel('x_n');
title('r = 3.5')

%%% COBWEB DIAGRAM FG 10.2.6 STROGATZ%%

r = 3.9;
figure
hold on
for ii=1:N-1
    x(ii+1) =  r*x(ii)*(1-x(ii));
    line([x(ii),x(ii)],[x(ii),x(ii+1)]);
    line([x(ii),x(ii+1)],[x(ii+1),x(ii+1)]);
    
    
end
X = 0:0.05:1;
Y = r*X.*(1-X);
plot(X,Y,'r')
plot(X,X,'r')
hold off
xlabel('x_n');
ylabel('x_(n+1)');
title('r = 3.9 cobweb')

%%% ORBIT DIAGRAM FIG 10.2.6 STROGATZ%%
N = 300;
x = zeros(1,N);
r = 3.4:0.01:4;
figure
hold on
x0 = 0.1;
for jj = 1:length(r)
  for ii = 1:N
    x0 =  r(jj)*x0*(1-x0);
  end
  x(1) = x0;
  for ii = 1:N-1
    x(ii+1) =  r(jj)*x(ii)*(1-x(ii));
  end
    
  plot(r(jj)*ones(length(x)),x,'r.')
end
xlabel('r')
ylabel('x')
title('Orbit map')
hold off



% Making a periodic window for appearance of 3 period cycles
r = 3.835;
syms x
f = r*(x)*(1-x);
a = compose(f,f);
a = compose(f,a);
figure
fplot(a,[0,1],'r')
hold on
plot(X,X)
xlabel('x')
title('3 period r = 3.835')
ylabel('f^3x')
grid on

r = 3.8;

f = r*(x)*(1-x);
a = compose(f,f);
a = compose(f,a);
figure
fplot(a,[0,1],'r')
hold on
plot(X,X)
xlabel('x')
title('3 period r = 3.8 ')
ylabel('f^3x')
grid on

%%% Logistic maps liapunov exponent calculation %%%
r    = 3:0.005:4;
lamb = zeros(1,length(r));
N    = 300;
n    = 1e4;
x0   = 0.1;
lamb0= 0; 
figure
hold on
for jj = 1:length(r)
  
  for ii = 1:N
    x0 =  r(jj)*x0*(1-x0);
  end
  
  lamb(jj) = log(abs(r(jj)-2*r(jj)*x0)); 
  
  for ii = 1:n
    x0       =  r(jj)*x0*(1-x0);
    lamb(jj) = lamb(jj) + log(abs(r(jj)-2*r(jj)*x0));
    
  end
  lamb(jj) = lamb(jj)/n;  
  
end

plot(r,lamb,'r')
xlabel('r')
title('Logistic maps liapunov exponent')
ylabel('liapunov exponent')
grid on













