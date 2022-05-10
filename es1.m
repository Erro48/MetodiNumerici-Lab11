% PDF: Esercitazione_Approssimazione_interpolazione.pdf
clc
clear all

% x = [-3.5; -3; -2; -1.5; -0.5; 0.5; 1.7; 2.5; 3];
% y = [-3.9; -4.8; -3.3; -2.5; 0.3; 1.8; 4; 6.9; 7.1];

x = [1.001; 1.0012; 1.0013; 1.0014; 1.0015; 1.0016];
y = [-1.2; -0.95; -0.9; -1.15; -1.1; -1];

xv = linspace(min(x), max(x));
figure
plot(x, y, 'o')

n = input('Grado del polinomio: ');
A = costruisciVandermonde(x, n + 1);

% Metodo delle equazioni normali
[aEN, flag, condG] = metodoEN(A, y);

if flag ~= 0
   disp('ATTENZIONE: matrice numericamente non definita positiva')
end

polEN = pvalHorner(aEN, xv);

% Metodo QR
aQR = metodoQR(A, y);
polQR = pvalHorner(aQR, xv);

hold on
plot(xv, polEN, 'r--', xv, polQR, 'b:')
legend('Coppie di dati', 'Metodo EN', 'Metodo QR', 'Location', 'south')

% Calcolo del residuo del metodo EN
polENx = pvalHorner(aEN, x);
resEN = norm(y - polENx)^2

% Calcolo del residuo del metodo QR
polQRx = pvalHorner(aQR, x);
resQR = norm(y - polQRx)^2

