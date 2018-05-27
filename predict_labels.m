% Babariya, Komal

function predicted_labels = predict_labels(train_features, train_labels, test_features)
no_test_instances = size(test_features,2);
test_labels = zeros(1,no_test_instances);
n = size(train_features,2);

% Multiplying each test feature with the train feature matrix and
% calulating the the maximum sum index to predict the test label
for i = 1:no_test_instances
    dot_multiplication = repmat(test_features(:,i),1,n).* train_features;
    summing_row = sum(dot_multiplication,1);
    [max_val, index_no] = max(summing_row);
    test_labels(1,i) = train_labels(1,index_no);
end
predicted_labels = test_labels;
end
