disp("Start")
%% Inicjalizacja
% Import funkcji
addpath 'pti-01/scripts'
addpath 'pti-01/scripts/vector'

% Ustawienie danych wejsciowych
oryginal = "pti-01/skryba/monolog-skryby-oryginal.mp3";
kobiecy = "pti-01/skryba/monolog-skryby-k.mp3";
codes = [2000, 1000, 500];
vector_len = [200];
functions = {@vector_q};
function_names = ["vector"];
output = "pti-01/scripts/vector/outputs";
% docelowo chyba zrobimy folder outputs gdzieś bardziej ogólny

%% Dla wektorowej - oryginał
% Utworzenie tabelki na wyniki MSE w zależności od metody i 
mse_table_oryginal = zeros(length(codes), length(vector_len));

% Przeliczenie wyników dla głosu oryginalnego
for i = 1:length(vector_len)
    disp("Evaluating function: " + function_names(1))
    % ta funckja generuje pliki muzyczne i wykresy
    v_mse = generate_all_vector(oryginal, codes, vector_len(i), functions{1}, output, function_names(1), true, true);
    mse_table_oryginal(:, i) = v_mse;
end

% Wyniki w tabeli, która nadaje się do eksportu do latexa
mse_table_oryginal

%% Dla wektorowej - kobiecy
% Utworzenie tabelki na wyniki MSE w zależności od metody i 
mse_table_kobiecy = zeros(length(codes), length(vector_len));

% Przeliczenie wyników dla głosu oryginalnego
for i = 1:length(vector_len)
    disp("Evaluating function: " + function_names(1))
    % ta funckja generuje pliki muzyczne i wykresy
    v_mse = generate_all_vector(kobiecy, codes, vector_len(i), functions{1}, output, function_names(1), true, true);
    mse_table_kobiecy(:, i) = v_mse;
end

% Wyniki w tabeli, która nadaje się do eksportu do latexa
mse_table_kobiecy

disp("Finish")