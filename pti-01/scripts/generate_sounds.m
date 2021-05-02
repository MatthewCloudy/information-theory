function [vector_mse] = generate_sounds(filepath, splits, q_method, destination, method_name)
%GENERATE_Q_SIGNAL
%   Argumenty:
%       - filepath - ścieżka do pliku, który mamy potraktować kwantyzacją
%       - splits - wektor liczb podziałów, np [1000, 100, 50, 10 5]
%       - q_method - funkcja (signal, n) -> [signal_quantized, mse]
%       - destination - ścieżka do folderu, w którym mają się pojawiać pliki
%       - method_name - nazwa metody którą kwantyzujemy, np "scalar"
%       dźwiekowe wyprodukowane po kwantyzacji
%   Zwraca:
%       - vector_mse - wektor mse które wyjdą z q_method, w kolejności
%       odpowiadającej kolejności z splits
%   Założenia:
%       - plik pod filepath ma mieć dwa kanały dźwięku (stereo)

% Inicjacja wektora na mse
vector_mse = splits;
mse = zeros(1, 2);

% Wydobycie nazwy pliku bez rozszerzenia
nazwa_pliku = split(filepath,"/");
nazwa_pliku = split(nazwa_pliku(end), ".");
nazwa_pliku = nazwa_pliku(1);

% Utworzenie folderu plots w podanej ścieżce wyjściowej
plots_path = destination + "/plots";

% Konwersja pliku na sygnał
[sygnal, probkowanie] = audioread(filepath);
disp("Probkowanie: " + probkowanie + "Hz")

sygnal_wyjsciowy = sygnal; % Inicjacja wektora na sygnaly po kwantyzacji
disp("Utworzone pliki:")
% Dla każdej liczby podziałów
j = 0; 
for n = splits
    j = j + 1;
    
    % Dla każdego kanału sygnału
    for i = 1:2
        sygnal_kanal = sygnal(:, i);
        
        % Wykonujemy metodę i zapisujemy oba kanaly po kwantyzacji
        [sygnal_wyjsciowy(:, i), mse(i)] = q_method(sygnal_kanal, n);
        
    end
    
    % Wygeneruj wykres dla jednego kanału
    generate_plots(sygnal(:, 1), sygnal_wyjsciowy(:, 1), (probkowanie):(round(probkowanie*1.249)), n, method_name, plots_path)
    
    % Zapisz dane i plik wyśjściowy
    vector_mse(j) = mean(mse);
    filename = destination + "/" + method_name + "-" + nazwa_pliku + n + ".wav"
    audiowrite(filename, sygnal_wyjsciowy, probkowanie);
end

