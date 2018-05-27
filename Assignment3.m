% Babariya, Komal

clc;
clear all;

params = struct();
params.win_size = 1024;
params.hop_size = 512;
params.min_freq = 86;
params.max_freq = 8000;
params.num_mel_filts = 40;
params.n_dct = 15;
fpath1 = 'Audios\Piano1';
fpath2 = 'Audios\Piano2';
fpath3 = 'Audios\Trumpet1';
fpath4 = 'Audios\Trumpet2';
fpath5 = 'Audios\Trombone1';
fpath6 = 'Audios\Trombone2';

% Comparing Piano and Trumpet
[train_piano_trumpet_feature, train_piano_trumpet_label] = create_set(fpath1, fpath3, params);
[test_piano_trumpet_feature, test_piano_trumpet_label] = create_set(fpath2, fpath4, params);
predicted_piano_trumpet_labels = predict_labels(train_piano_trumpet_feature, train_piano_trumpet_label, test_piano_trumpet_feature);
[overall_accuracy_ptru, per_class_accuracy_ptru] = score_prediction(test_piano_trumpet_label, predicted_piano_trumpet_labels);

% % Comparing Piano and Trombone
% [train_piano_trombone_feature, train_piano_trombone_label] = create_set(fpath1, fpath5, params);
% [test_piano_trombone_feature, test_piano_trombone_label] = create_set(fpath2, fpath6, params);
% predicted_piano_trombone_labels = predict_labels(train_piano_trombone_feature, train_piano_trombone_label, test_piano_trombone_feature);
% [overall_accuracy_ptro, per_class_accuracy_ptro] = score_prediction(test_piano_trombone_label, predicted_piano_trombone_labels);

% Comparing Trombone and Trumpet
[train_trombone_trumpet_feature, train_trombone_trumpet_label] = create_set(fpath5, fpath3, params);
[test_trombone_trumpet_feature, test_trombone_trumpet_label] = create_set(fpath6, fpath4, params);
predicted_trombone_trumpet_labels = predict_labels(train_trombone_trumpet_feature, train_trombone_trumpet_label, test_trombone_trumpet_feature);
[overall_accuracy_trotru, per_class_accuracy_trotru] = score_prediction(test_trombone_trumpet_label, predicted_trombone_trumpet_labels);

