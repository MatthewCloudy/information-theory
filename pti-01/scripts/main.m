disp("Start")
% Import funkcji
addpath '/home/michal/Documents/pti/pti-01/scripts'
addpath '/home/michal/Documents/pti/pti-01/scripts/scalar'

% Ustawienie danych wejsciowych
oryginal = "pti-01/skryba/monolog-skryby-oryginal.mp3";
kobiecy = "pti-01/skryba/monolog-skryby-oryginal.mp3";
splits = [1000, 100, 50, 10, 5];
functions = {@scalar_q, @scalar_q, @scalar_q};
function_names = ["scalar", "scalar2", "scalar3"];
output = "pti-01/scripts/scalar/outputs";
% docelowo chyba zrobimy folder outputs gdzieś bardziej ogólny

% Utworzenie tabelki na wyniki MSE w zależności od metody i 
mse_table = zeros(length(splits), length(functions));

% Przeliczenie wyników dla głosu oryginalnego
for i = 1:length(functions)
    disp("Evaluating function: " + function_names(i))
    % ta funckja generuje pliki muzyczne i wykresy
    v_mse = generate_sounds(oryginal, splits, functions{i}, output, function_names(i));
    mse_table(:, i) = v_mse;
end

% Wyniki w tabeli, która nadaje się do eksportu do latexa
%       metody
%    _____________
% s |
% p |
% l |
% i |
% t |
% s |

mse_table

disp("Finish")