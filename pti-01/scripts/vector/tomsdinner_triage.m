audio = load("tomsdinner44100.mat").data;
l = length(audio(:,1));
for i = 1:l
    if audio(i,1) ~= 0 || audio(i,2) ~= 0
        break
    end
end
audioP = audio(i:l,1);
audioL = audio(i:l,2);
vectorLength = 1000;
codebookSize = 100;
audioPvectors = splitVector(audioP,vectorLength);
audioLvectors = splitVector(audioL,vectorLength);

codebookP = fillCodeBook(codebookSize,audioPvectors);
codebookL = fillCodeBook(codebookSize,audioLvectors);

quantisizedVectorsP = quantisize(codebookP, audioPvectors);
quantisizedVectorsL = quantisize(codebookL, audioLvectors);

quantisizedAudio = zeros(l+vectorLength,2);
for i = 1:size(quantisizedVectorsP,2)
    quantisizedAudio( ((i-1)*vectorLength + 1):(i*vectorLength), 1 ) = quantisizedVectorsP(:,i)';
    quantisizedAudio( ((i-1)*vectorLength + 1):(i*vectorLength), 2 ) = quantisizedVectorsL(:,i)';
end

audiowrite('tomsdinner_mod.wav',quantisizedAudio,44100);