% Babariya, Komal

function [overall_accuracy, per_class_accuracy] = score_prediction(test_labels, predicted_labels)

% Calculating all the unmatch with test_label = 1 and predict_label = 2
test_label1_index = find(test_labels==1);
total_label1 = size(test_label1_index, 2);
label1_unmatch = sum(predicted_labels(test_label1_index)==2);
label1_acc = (total_label1 - label1_unmatch)*100/total_label1;

% Calculating all the unmatch with test_label = 2 and predict_label = 1
test_label2_index = find(test_labels==2);
total_label2 = size(test_label2_index, 2);
label2_unmatch = sum(predicted_labels(test_label2_index)==1);
label2_acc = (total_label2 - label2_unmatch)*100/total_label2;

% Over all accuracy
overall_accuracy = (total_label1 - label1_unmatch + total_label2 - label2_unmatch)*100/(total_label1 + total_label2);
per_class_accuracy = [label1_acc label2_acc];
end
