% Ejercicio 3 - Método de la Potencia
clc;
clear;

% Matriz de ejemplo para el ejercicio
A = [4, 1; 2, 3]; % Puedes reemplazar con la matriz del ejercicio 15

% Parámetros
tol = 1e-6; % Tolerancia
max_iter = 100; % Máximo número de iteraciones

% Parte i) Implementación del Método de la Potencia
fprintf('Método de la Potencia sin Escalamiento:\n');
[lambda_no_scaling, v_no_scaling, iter_no_scaling] = power_method(A, tol, max_iter, false);
fprintf('Valor Propio: %.6f, Vector Propio: [%f, %f], Iteraciones: %d\n', ...
    lambda_no_scaling, v_no_scaling(1), v_no_scaling(2), iter_no_scaling);

fprintf('\nMétodo de la Potencia con Escalamiento:\n');
[lambda_scaling, v_scaling, iter_scaling] = power_method(A, tol, max_iter, true);
fprintf('Valor Propio: %.6f, Vector Propio: [%f, %f], Iteraciones: %d\n', ...
    lambda_scaling, v_scaling(1), v_scaling(2), iter_scaling);

% Parte ii) Resolver ejercicio 15
fprintf('\nEjercicio 15 (usando método con escalamiento):\n');
A_ex15 = [6, 2, 1; 2, 3, 1; 1, 1, 1]; % Matriz del ejercicio 15
[lambda_ex15, v_ex15, iter_ex15] = power_method(A_ex15, tol, max_iter, true);
fprintf('Valor Propio: %.6f, Vector Propio: [%f, %f, %f], Iteraciones: %d\n', ...
    lambda_ex15, v_ex15(1), v_ex15(2), v_ex15(3), iter_ex15);

% Función Método de la Potencia
function [lambda, v, iter] = power_method(A, tol, max_iter, scaling)
    n = size(A, 1);
    v = rand(n, 1); % Vector inicial aleatorio
    v = v / norm(v); % Normalizar
    
    lambda_old = 0; % Inicializar valor propio
    for iter = 1:max_iter
        w = A * v;
        if scaling
            % Escalamiento
            lambda = max(abs(w));
            v = w / lambda;
        else
            % Sin escalamiento
            lambda = dot(v, w);
            v = w / norm(w);
        end
        
        % Criterio de convergencia
        if abs(lambda - lambda_old) < tol
            break;
        end
        lambda_old = lambda;
    end
end
