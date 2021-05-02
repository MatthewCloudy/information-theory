% Kwantyzacja skalarna
% Wczytanie pliku
sciezka = "pti-01/skryba/monolog-skryby-k";
rozszerzenie = ".mp3";
[sygnal, probkowanie] = audioread(sciezka + rozszerzenie);
sygnal_1_kanal = sygnal(:, 1);

% Wykres pierwszych 5 sekund sygnału z jednego kanału
hold on
plot(sygnal_1_kanal(1:probkowanie*5))

% Wygenerowanie podziały na n przedziałów
n = 100;
[partition, codebook] = podzialy(sygnal_1_kanal, n);

% Obiekt ScalarQuantizerEncoder
scalar_q = dsp.ScalarQuantizerEncoder(BoundaryPoints = partition, CodewordOutputPort = true(1), Codebook = codebook);
[indeksy, sygnal_po_kwantyzacji] = scalar_q(sygnal_1_kanal);

% Wykres 0.25 sekundy sygnału przed i po kwantyzacji 
hold on
plot(sygnal_1_kanal(1:probkowanie/4), '-b')
plot(sygnal_po_kwantyzacji(1:probkowanie/4), '.r')

%zapisz dźwięk
sciezka_out = "pti-01/scripts/scalar/outputs/";
nazwa_out = "kobiecy";
rozszerzenie_out = ".wav";
out = sciezka_out + nazwa_out + "_" + n + rozszerzenie_out;

audiowrite(out, sygnal_po_kwantyzacji, probkowanie)
