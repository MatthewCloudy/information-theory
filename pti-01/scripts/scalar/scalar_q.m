function [signal_quantized, mse] = scalar_q(signal, n)
%SCALAR_Q
%   Argumenty:
%       - signal - oryginalny sygnał 
%       - n - liczba przedziałów na które dzielimy zbiór wartości
%   Zwraca:
%       - signal_quantized - sygnał po kwantyzacji
%       - mse - błąd średniokwadratowy sygnału po kwantyzacji względem
%       oryginalnego

    [partition, codebook] = podzialy(signal, n);
    scalar_q = dsp.ScalarQuantizerEncoder(BoundaryPoints = partition, CodewordOutputPort = true(1), Codebook = codebook);
    [indexes, signal_quantized] = scalar_q(signal);
    mse = mean((signal - signal_quantized).^2);
end

