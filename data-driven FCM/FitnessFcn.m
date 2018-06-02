function [ costValue ] = FitnessFcn(weightVector)
% fitness function obtains the weights (a chromosome) and
% returns its cost value (1 means best & 0 means worst)

maxIt = 8;
finalValue = 0.0;
E = weightVector;

% obtaining each case's data (concepts' initial state vector)
% & putting them into the concepts (respectively)
% p stands for patient

for numOfPatients = 0:85
    
    theCase = csvread("dataset.dat", numOfPatients, 0, [numOfPatients, 0, numOfPatients, 20]);
    
    coca = theCase(1);
    sweet = theCase(2);
    gums = theCase(3);
    brushFreq = theCase(4);
    brushTime = theCase(5);
    floss = theCase(6);
    fluoride = theCase(7);
    livingArea = theCase(8);
    education = theCase(9);
    parentsEdu = theCase(10);
    income = theCase(11);
    fruitAndMilk = theCase(12);
    teethSpot = theCase(13);
    calmativeDrugs = theCase(14);
    salivaryPoverty = theCase(15);
    oralBreathing = theCase(16);
    cigarette = theCase(17);
    previousCaries = theCase(18);
    familyCaries = theCase(19);
    teethDistance = theCase(20);
    saliva = 0.0;
    dentalHygiene = 0.0;
    dentalCaries = 0.0;
    knownDentalCaries = theCase(21);
    
    
    A = [ cigarette, oralBreathing, salivaryPoverty, ...
      calmativeDrugs, teethSpot, fruitAndMilk, income, ...
      parentsEdu, education, livingArea, brushTime, floss, ...
      fluoride, brushFreq, sweet, coca, gums, previousCaries, ...
      teethDistance, familyCaries, saliva, dentalHygiene, ...
      dentalCaries];

    %temp = size(E);
    %n = temp(1,1);
    n = 23;
 
    % computing the state vector's next value (using nextState Fcn)
    for numOfIterations = 1:maxIt
   
        for i=1:n
            A(i) = nextState (A,E,i);
        end
    
      % disp( 'State Vector :');
      % disp(A);
      
    end

    finalValueOfFCM = A(23);
    
    % obtaining the final value of the goal concept (here: saliva)
    % which was known before and was included in the dataset

    finalValueOfDataset = knownDentalCaries;


    % computing the Error_L2
    fitnessFcnValue = (finalValueOfFCM - finalValueOfDataset).^2;
    finalValue = finalValue + fitnessFcnValue;
    
end
    
% when we used the pop(1) for all dataset (patients 1 to z)
% we have the final fitnessFcnValue, now we have to compute
% the Fitness Function Value(Score) which is returned to the
% ga algorithm function as 'costValue'

% first procedure:

%alpha = 0.1;
%Error_L2 = alpha * finalValue;
%h = 1/((Error_L2)+1);
%costValue = 1- h;

% second procedure:

costValue = finalValue;

end

