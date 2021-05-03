disp("Start")
%% Inicjalizacja
% Import funkcji
addpath 'pti-01/scripts'
addpath 'pti-01/scripts/scalar'
addpath 'pti-01/scripts/lloyd'

% Ustawienie danych wejsciowych
oryginal = "pti-01/skryba/monolog-skryby-oryginal.mp3";
kobiecy = "pti-01/skryba/monolog-skryby-k.mp3";
splits = [1000, 100, 50, 10, 5];
functions = {@scalar_q, @lloyd_q};
function_names = ["scalar", "lloyd"];
output = "pti-01/scripts/scalar/outputs";
% docelowo chyba zrobimy folder outputs gdzieś bardziej ogólny

%% Dla skalarnych - oryginał
% Utworzenie tabelki na wyniki MSE w zależności od metody i 
mse_table_oryginal = zeros(length(splits), length(functions));

% Przeliczenie wyników dla głosu oryginalnego
for i = 1:length(functions)
    disp("Evaluating function: " + function_names(i))
    % ta funckja generuje pliki muzyczne i wykresy
    v_mse = generate_all(oryginal, splits, functions{i}, output, function_names(i), true, true);
    mse_table_oryginal(:, i) = v_mse;
end

% Wyniki w tabeli, która nadaje się do eksportu do latexa
mse_table_oryginal

%% Dla skalarnych - kobiecy
% Utworzenie tabelki na wyniki MSE w zależności od metody i 
mse_table_kobiecy = zeros(length(splits), length(functions));

% Przeliczenie wyników dla głosu oryginalnego
for i = 1:length(functions)
    disp("Evaluating function: " + function_names(i))
    % ta funckja generuje pliki muzyczne i wykresy
    v_mse = generate_all(kobiecy, splits, functions{i}, output, function_names(i), true, true);
    mse_table_kobiecy(:, i) = v_mse;
end

% Wyniki w tabeli, która nadaje się do eksportu do latexa
mse_table_kobiecy

disp("Finish")