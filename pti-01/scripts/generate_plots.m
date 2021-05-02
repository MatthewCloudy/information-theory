function [] = generate_plots(signal_orginal, signal_quantized, range, split_n, method, output_path)
%GENERATE_PLOTS Generuje i zapisuje wykresy do wyspecyfikowanego folderu
%   Argumenty:
%       - signal_original - oryginalny sygnał
%       - signal_quantized - sygnał po kwantyzacji
%       - range - zakres wykresu, np, 1:probkowanie*5 to pierwsze 5 sekund
%       - split_n - liczba przedziałów dla której został wygenerowany
%       - output_path - ścieżka zapisu pliku
%       sygnał po kwantyzacji
%       - method - nazwa metody kwantyzacji - użyta w tytule

filename = output_path + "/" + method + "-" + split_n;

f = figure('visible','off');
plot(signal_orginal(range), '-b');
hold on;
plot(signal_quantized(range), '.r');
hold off;
title("Sygnał przy podziale na " + split_n + " - " + method);
set(gcf,'units','points','position',[0, 0, 1000, 200]);
saveas(f, filename, "epsc");

end

