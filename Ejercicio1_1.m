% Ejercicio 1: Problema 5.4 (Capillary Networks)
clc;
clear;

% Matriz A (representa la red capilar)
A = [
    -1/4, 1/10, 1/10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     1/10, -1/2, 0, 1/5, 1/5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     1/10, 0, -1/2, 0, 0, 1/5, 1/5, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 1/5, 0, -1, 0, 0, 0, 0.4, 0.4, 0, 0, 0, 0, 0, 0;
     0, 1/5, 0, 0, -1, 0, 0, 0, 0, 0.4, 0.4, 0, 0, 0, 0;
     0, 0, 1/5, 0, 0, -1, 0, 0, 0, 0, 0, 0.4, 0.4, 0, 0;
     0, 0, 1/5, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0.4, 0.4;
     0, 0, 0, 0.4, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0.4, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0.4, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0.4, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0.4, 0, 0, 0, 0, 0, -2, 0, 0, 0;
     0, 0, 0, 0, 0, 0.4, 0, 0, 0, 0, 0, 0, -2, 0, 0;
     0, 0, 0, 0, 0, 0, 0.4, 0, 0, 0, 0, 0, 0, -2, 0;
     0, 0, 0, 0, 0, 0, 0.4, 0, 0, 0, 0, 0, 0, 0, -2
];

% Vector b
b = [-5/2; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

% Resolución del sistema Ap = b
p = A\b;

% Resultados
fprintf('Solución del sistema (presiones en los nodos):\n');
disp(p);

% Gráfica de las presiones
figure;
stem(p, 'filled', 'LineWidth', 1.5);
title('Presión en los nodos de la red capilar');
xlabel('Nodos');
ylabel('Presión (mmHg)');
grid on;
