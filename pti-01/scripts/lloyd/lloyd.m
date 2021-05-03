% Kwantyzacja Metoda Lloyda-Maxa
% Wczytanie pliku
sciezka = "pti-01/skryba/monolog-skryby-oryginal";
rozszerzenie = ".mp3";
[sygnal, probkowanie] = audioread(sciezka + rozszerzenie);
sygnal_1_kanal = sygnal(:, 1);

% Wygenerowanie podzialow na n przedzialow 
% (funkcja lloyds() z pakietu Communications Toolbox)
n = 10;
[partition, codebook] = lloyds(sygnal_1_kanal, n);
partition=[min(sygnal_1_kanal) partition min(sygnal_1_kanal)];

% Obiekt ScalarQuantizerEncoder
scalar_q = dsp.ScalarQuantizerEncoder("BoundaryPoints", partition,...
    "CodewordOutputPort", true(1), "Codebook", codebook);
[indeksy, sygnal_po_kwantyzacji] = scalar_q(sygnal_1_kanal);

% Wykres 0.25 sekundy sygnału przed i po kwantyzacji 
hold on
title("Sygnał przy podziale na " + n)
plot(sygnal_1_kanal(1:probkowanie/4), '-b')
plot(sygnal_po_kwantyzacji(1:probkowanie/4), '.r')

% Zapisz dzwiek
sciezka_out = "pti-01/scripts/lloyd/outputs/";
nazwa_out = "kobiecy";
rozszerzenie_out = ".wav";
out = sciezka_out + nazwa_out + "_" + n + rozszerzenie_out;
