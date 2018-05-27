% Babariya, Komal

function [features, labels] = create_set(fpath1, fpath2, params)

file_paths = {fpath1, fpath2};

% unbind struct parameters
win_size = params.win_size;
hop_size = params.hop_size;
min_freq = params.min_freq;
max_freq = params.max_freq;
num_mel_filts = params.num_mel_filts;
n_dct = params.n_dct;

% Looping each file of the 2 given filepath to calculate feature matrix
for i = 1:2
    directory = file_paths{i};
    files = dir(strcat(directory,'\*.wav'));
    for j = 1:length(files)
        [mfcc mfcc_fs] = compute_mfccs(strcat(directory,'\',files(j).name),win_size, hop_size, min_freq, max_freq, num_mel_filts, n_dct);
        if(i ==1 && j==1)
            coeff = mfcc;
            class = ones(1,size(mfcc,2));
        else
            coeff = cat(2,coeff,mfcc);
            class = cat(2,class,(i*ones(1,size(mfcc,2))));
        end
    end
end
features = coeff;
labels = class;
end


