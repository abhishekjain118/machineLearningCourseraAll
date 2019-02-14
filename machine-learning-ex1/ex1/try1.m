v = 1:10;
v(1) = 2
  if v(1) == 1,
    disp('the value is one');
  elseif v(1) == 2, 
    disp('the value is 2');
  else 
    disp('the value is not 1 and not 2');
  end; 
  
  
  
function [y1, y2] = squareAndCube(x)
  y1 = x^2
  y2 = x^3
   
endfunction
function y = squareThisNumber(x)
  y = x^2
endfunction
function z = something(x)
  z = x*rand()
endfunction
