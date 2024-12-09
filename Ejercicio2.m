% Ejercicio 2 - Métodos Jacobi y Gauss-Seidel
clc;
clear;

% Definición de sistemas lineales
A1 = [1, 2; 2, 1];
b1 = [1; 2];
A2 = [2, 1; 1, 2];
b2 = [2; 1];

% Punto inicial
x0 = [-0.5; 0.5];
num_iter = 5;

% Función para calcular Jacobi y Gauss-Seidel
fprintf('Sistema 1:\n');
[x_jacobi_1, x_gs_1, eig_J1] = solve_system(A1, b1, x0, num_iter);
fprintf('\nSistema 2:\n');
[x_jacobi_2, x_gs_2, eig_J2] = solve_system(A2, b2, x0, num_iter);

% Función para resolver un sistema con Jacobi y Gauss-Seidel
function [x_jacobi, x_gs, eig_J] = solve_system(A, b, x0, num_iter)
    n = length(b);
    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    
    % Matrices de iteración
    T_jacobi = -D\(L + U);
    T_gs = -(D + L)\U;
    
    eig_J = eig(T_jacobi); % Valores propios de Jacobi
    
    % Método de Jacobi
    x_jacobi = x0;
    fprintf('Jacobi:\n');
    for k = 1:num_iter
        x_new = T_jacobi * x_jacobi + D\b;
        error = norm(x_new - x_jacobi);
        fprintf('Iteración %d: x = [%f, %f], Error = %f\n', k, x_new(1), x_new(2), error);
        x_jacobi = x_new;
    end
    
    % Método de Gauss-Seidel
    x_gs = x0;
    fprintf('\nGauss-Seidel:\n');
    for k = 1:num_iter
        x_new = T_gs * x_gs + (D + L)\b;
        error = norm(x_new - x_gs);
        fprintf('Iteración %d: x = [%f, %f], Error = %f\n', k, x_new(1), x_new(2), error);
        x_gs = x_new;
    end
    
    % Imprimir valores propios
    fprintf('\nValores propios de Jacobi: [%f, %f]\n', eig_J(1), eig_J(2));
end
