% Funkcja tworząca podział sygnału na n przedziałów
function[partition, codebook] = podzialy(signal, n)
    max_value = max(signal);
    min_value = min(signal);
    
    partition = linspace(min_value, max_value, n);
    difference = partition(2) - partition(1);
    codebook = linspace(min_value + difference/2, max_value - difference/2, n - 1);
end
