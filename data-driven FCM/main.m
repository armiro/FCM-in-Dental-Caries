% the main ga file

nvar = 506;
LB = repmat(-1, 1, 506);
UB = ones(1, 506);

options = optimoptions('ga', 'SelectionFcn', @selectionroulette, ...
'MaxStallGenerations', 50, 'PlotFcn', ...
{@gaplotbestindiv, @gaplotbestf},  ...
'PopulationSize', 300);
[x, fval]= ga(@FitnessFcn , nvar, [], [], [], [], LB, UB, [], options);

disp('best fitness function value is: ')
disp(fval);
disp('the resulting weight vector is: ')
disp(x)

