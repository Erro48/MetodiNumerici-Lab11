clc
clear all

n = 5;
f = @(x) 1 ./ (1 + x.^2); 
x = linspace(-5, 5, n+1);
y = f(x);
xv = linspace(-5, 5);

pol = interpLagrange(x, y, xv)

figure
plot(xv, pol, 'r-', xv, f(xv), 'b:', x, y, 'o')
legend('Pol Lagrange', 'Funzione esatta', 'Dati noti')
