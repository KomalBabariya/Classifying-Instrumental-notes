% Babariya, Komal

function [mfccs, fs_mfcc] = compute_mfccs(filepath, win_size, hop_size, min_freq, max_freq, num_mel_filts, n_dct)
% Reading audio file
[y, fs] = audioread(filepath);

% If its stereo convert it into mono file by discarding 2nd channel
xt = y(:,1)';

% Padding signal by N/2 in the starting and ending as well.
xt = [zeros(1,win_size/2), xt, zeros(1,win_size/2)];

% Computing Spectrogram with the padded signal
[s, f, t] = spectrogram(xt,hamming(win_size),(win_size - hop_size),win_size,fs);

% Calculating center frequencies for filter bank between max and min
% frequency(Hz)
mel_min_freq = hz2mel(min_freq);
mel_max_freq = hz2mel(max_freq);
center_freq_mel = linspace(mel_min_freq,mel_max_freq,num_mel_filts);
diff = center_freq_mel(2) - center_freq_mel(1);
center_freq_mel = [center_freq_mel(1)-diff, center_freq_mel, center_freq_mel(end) + diff];
center_freq_hz = mel2hz(center_freq_mel);

% filter bank
[nearest_indices] = find_nearest(f,center_freq_hz);
new_center_freq = f(nearest_indices);
filter_bank = zeros(num_mel_filts,nearest_indices(end));
for i =2:length(new_center_freq)-1
    k1 = new_center_freq(i-1);
    k = new_center_freq(i);
    k2 = new_center_freq(i+1);
    for j=nearest_indices(i-1):nearest_indices(i+1)
            if(f(j)<=k)
                filter_bank(i-1,j)= (f(j)-k1)/(k-k1);
            else
                filter_bank(i-1,j)= (k2-f(j))/(k2-k);
            end
    end
end

filter_bank = diag(1./sum(filter_bank,2))*filter_bank;

% Mel power Spectrum
mel_power_spec = filter_bank*(20*log10(abs(s(1:nearest_indices(end),:))));

% Computing DCT along each column and removing all the high coefficient and row 1.
dct_mel_spectrum = dct(mel_power_spec);
dct_mel_spectrum = dct_mel_spectrum(2:n_dct,:);

% Normalzing dct output for MFCC's

dct_mean = repmat(mean(dct_mel_spectrum),n_dct-1,1);
dct_std = repmat(std(dct_mel_spectrum),n_dct-1,1);
mfccs = (dct_mel_spectrum - dct_mean)./dct_std;
% mfccs = dct_mel_spectrum * diag(1./sum(dct_mel_spectrum,1));
fs_mfcc = 1/(t(2)-t(1));
end
