load ("finalValues.mat");
E = finalValues;
filename = 'finalValues.xlsx';
xlswrite(filename, E);