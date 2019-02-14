X = [1 1; 1 2; 1 3]
y = [1;2;3]

function J = costFunctionJ(X, y, theta)
  
  m = size(X, 1)
  prediction = X*theta
  sqrErrors = (prediction-y).^2
  J = 1/(2*m) * sum(sqrErrors);
endfunction
