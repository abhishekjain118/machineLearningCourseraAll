function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples 

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta)); %2*1

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

y_pred = X*theta; % mx2 * 2x1
sum_of_square_error = sum((y_pred - y).^2);
J = 1/(2*m)*sum_of_square_error + (lambda/(2*m))*(sum(theta(2:end).^2));


grad(1) = (1/m)*(X(:,1)'*(y_pred - y)); % for j=0. 
Xt  = X(:,2:end); %remove 1 column of X dim=m x (n-1)
grad(2:end) = (1/m)*(Xt'*(y_pred - y)) + (lambda/m)*theta(2:end); % for j=0. 


% =========================================================================

grad = grad(:);

end
