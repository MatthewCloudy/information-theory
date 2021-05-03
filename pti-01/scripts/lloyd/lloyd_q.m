function [signal_quantized, mse] = lloyd_q(signal, n)
% LLOYD_Q
%   Argumenty:
%       - signal - oryginalny sygnał
%       - n - liczba przedziałów na które dzielimy zbiór wartości
%   Zwraca:
%       - signal_quantized - sygnał po kwantyzacji
%       - mse - błąd średniokwadratowy sygnału po kwantyzacji względem
%       oryginalnego

% Funkcja lloyds() z pakietu Communications Toolbox
[partition, codebook] = lloyds(signal, n);
partition=[min(signal) partition min(signal)];

% Kwantyzacja i obliczenie błędu
lloyd_q = dsp.ScalarQuantizerEncoder("BoundaryPoints", partition,...
    "CodewordOutputPort", true(1), "Codebook", codebook);
[~, signal_quantized] = lloyd_q(signal);
mse = mean((signal - signal_quantized).^2);

end
