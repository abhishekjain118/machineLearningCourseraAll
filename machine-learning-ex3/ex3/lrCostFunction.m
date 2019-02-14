function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

z = X*theta;
y_pred = sigmoid(z);
%theta_wo_theta0 = theta([2:size(theta)(1),:])
J = (-1/m)*(y'*log(y_pred) + (1-y)'*log(1-y_pred)) + lambda/(2*m)*sum(theta([2:size(theta),:]).^2);

%calculate grad(1) 
% matrix multiply X[:,1]' (1st column of X) with (y_pred - y)
grad(1) = (1/m)*(X(:,1)'*(y_pred - y));

%and now calculate rest of grad and then join them in one vector
% matrix multiply X[:,remaining col]' (remaining columns of X) with (y_pred - y)
Xt = X(:,[2:size(X,2)])'; %taking X col 2 onwards
grad_temp = (1/m)*(Xt*(y_pred - y)) + lambda/m.*theta([2:size(theta)]); % matrix multiplication 27xm X mx1 = 27x1
grad([2:size(grad)]) = grad_temp;


% =============================================================

%grad = grad(:);

end
