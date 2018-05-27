# Classifying-Instrumental-notes
This project classifies Piano, Trumpet and Trombone notes based on their MFCC's features with a basic classifier - Nearest mean Score.

Function Details

hz2mel(hzval)
% Convert a vector of values in Hz to Mels.
%
% Parameters
% ----------
% hzval : 1 x N array
%  values in Hz
%
% Returns
% -------
% melval : 1 x N array
%  values in Mels


mel2hz(melval)
% Convert a vector of values in Hz to Mels.
%
% Parameters
% ----------
% melval : 1 x N array
%  values in Mels
%
% Returns
% -------
% hzval : 1 x N array
%  values in Hz


compute mfccs(filepath, win_size, hop_size, min_freq, max_freq, num_mel_filts, n_dct)
% Compute MFCCs from audio file.
%
% Parameters
% ----------
% filepath : string
%  path to .wav file
% win_size : int
%  spectrogram window size (samples)
% hop_size : int
%  spectrogram hop size (samples)
% min_freq : float
%  minimum frequency in Mel filterbank (Hz)
% max_freq : float
%  maximum frequency in Mel filterbank (Hz)
% num_mel_filts: int
%  number of Mel filters
% n_dct: int
%  number of DCT coefficients
%
% Returns
% -------
% mfccs : n dct-1 x NT array
%  MFCC matrix (NT is number spectrogram frames)
% fs_mfcc : int
%  sample rate of MFCC matrix (samples/sec)


create_set(fpath1, fpath2, params)
% Compute features and parameters for training data.
%
% Parameters
% ----------
% fpath1: string
%  full path to audio file with training data from class 1
% fpath2: string
%  full path to audio file with training data from class 2
% params: struct
%  Matlab structure with fields are win_size, hop_size,
%  min_freq, max_freq, num_mel_filts, n_dct, the parameters
%  needed for computation of MFCCs
%
% Returns
% -------
% features: NF x NE matrix
%  matrix of training/testing set features (NF is number of
%  features and NE is number of feature instances)
% labels: 1 x NE array
%  vector of training/testing labels (class numbers) for each instance
%  of features

predict_labels(train_features, train_labels, test_features)
% Predict the labels of the test features,
% given training features and labels,
% using a nearest-neighbor classifier.
%
% Parameters
% ----------
% train_features: NF x NE train matrix
%  matrix of training set features (NF is number of
%  features and NE train is number of training feature instances)
% train_labels: 1 x NE train array
%  vector of labels (class numbers) for each instance
%  of train features
% test_features: NF x NE test matrix
%  matrix of test set features (NF is number of
%  features and NE test is number of testing feature instances)
%
% Returns
% -------
% predicted_labels: 1 x NE test array
%   array of predicted labels

score_prediction(test_labels, predicted_labels)
% Compute the confusion matrix given the test labels and predicted labels.
%
% Parameters
% ----------
% test_labels: 1 x NE array
%  array of ground truth labels for test data
% predicted_labels: 1 x NE test array
%  array of predicted labels
%
% Returns
% -------
% overall_accuracy: scalar
%  The fraction of correctly classified examples.
% per_class_accuracy: 1 x 2 array
%  The fraction of correctly classified examples
%  for each instrument class.
%  per_class_accuracy[1] should give the value for
%  instrument class 1, per_class_accuracy[2] for
%  instrument class 2
