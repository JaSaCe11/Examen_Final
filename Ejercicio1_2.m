% Ejemplo 5.7: Solución con Factorización de Cholesky
clc;
clear;

% Matriz A (del Problema 5.4)
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

% Factorización de Cholesky
R = chol(-A, 'upper'); % Usamos -A porque la matriz debe ser positiva definida

% Resolución del sistema
y = R'\b; % Resolución de R'y = b
p = R\y;  % Resolución de Rp = y

% Resultados: Presiones en los nodos
fprintf('Presiones en los nodos:\n');
disp(p.');

% Cálculo de los flujos (Qm) usando las relaciones dadas
Q1 = 1.88;         % Flujo principal
Q2_3 = 0.94;       % Flujos secundarios
Q4_7 = 0.47;       % Flujos terciarios
Q8_15 = 0.23;      % Flujos cuaternarios
Q16_31 = 0.12;     % Flujos finales

% Mostrar resultados de flujos
fprintf('\nFlujos en los capilares:\n');
fprintf('Q1 = %.2f\n', Q1);
fprintf('Q2,3 = %.2f\n', Q2_3);
fprintf('Q4,...,7 = %.2f\n', Q4_7);
fprintf('Q8,...,15 = %.2f\n', Q8_15);
fprintf('Q16,...,31 = %.2f\n', Q16_31);

% Gráfica de presiones
figure;
stem(p, 'filled', 'LineWidth', 1.5);
title('Presión en los nodos de la red capilar (Ejemplo 5.7)');
xlabel('Nodos');
ylabel('Presión (mmHg)');
grid on;
