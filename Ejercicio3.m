% Ejercicio 3 - Método de la Potencia con y sin escalamiento
clc;
clear;

% Definición de la matriz A y el vector inicial
A = [3, 0, 0;
     1, -1, 0;
     0, 2, 8];

x = [1; 1; 1]; % Vector inicial
n_iter = 4; % Número de iteraciones
eigenvalues = []; % Almacenar valores propios dominantes en cada iteración

fprintf('Con escalamiento\n');
fprintf('Iteración\tVector Propio Aproximado\t\tValor Propio Dominante\n');
fprintf('-----------------------------------------------------------\n');

for k = 1:n_iter
    % Multiplicación matriz por vector
    x_new = A * x;
    
    % Escalamiento: calcular el valor propio dominante aproximado
    lambda_max = max(abs(x_new)); 
    eigenvalues = [eigenvalues; lambda_max];
    
    % Normalización del vector
    x_new = x_new / lambda_max;
    
    % Imprimir resultados de esta iteración
    fprintf('%d\t\t[%.6f, %.6f, %.6f]\t%.6f\n', ...
        k, x_new(1), x_new(2), x_new(3), lambda_max);
    
    % Actualizar el vector
    x = x_new;
end

% Resultados finales
fprintf('\nValor Propio Dominante: %.6f\n', lambda_max);
fprintf('Vector Propio Asociado: [%.6f, %.6f, %.6f]\n', x(1), x(2), x(3));

fprintf('\n');
fprintf('Sin escalamiento\n');
fprintf('Iteración\tVector Propio Aproximado\t\tValor Propio Aproximado\n');
fprintf('-----------------------------------------------------------\n');

for k = 1:n_iter
    % Multiplicación matriz por vector
    x_new = A * x;
    
    % Calcular valor propio aproximado (sin escalamiento)
    lambda_approx = (x_new' * x) / (x' * x); % Rayleigh quotient
    eigenvalues = [eigenvalues; lambda_approx];
    
    % Normalización para evitar desbordamientos numéricos
    x_new = x_new / norm(x_new);
    
    % Imprimir resultados de esta iteración
    fprintf('%d\t\t[%.6f, %.6f, %.6f]\t%.6f\n', ...
        k, x_new(1), x_new(2), x_new(3), lambda_approx);
    
    % Actualizar el vector
    x = x_new;
end

% Resultados finales
fprintf('\nValor Propio Aproximado Final: %.6f\n', lambda_approx);
fprintf('Vector Propio Asociado: [%.6f, %.6f, %.6f]\n', x(1), x(2), x(3));
