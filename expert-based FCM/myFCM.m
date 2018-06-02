
maxIt = 2;
numOfPatients = 0;

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
    
E = csvread("weights.dat", 0, 0, [0, 0, 22, 22]);

A = [ cigarette, oralBreathing, salivaryPoverty, ...
      calmativeDrugs, teethSpot, fruitAndMilk, income, ...
      parentsEdu, education, livingArea, brushTime, floss, ...
      fluoride, brushFreq, sweet, coca, gums, previousCaries, ...
      teethDistance, familyCaries, saliva, dentalHygiene, ...
      dentalCaries];

temp = size(E);
n = temp(1,1);
   
for numOfIterations = 1:maxIt
   
        for i=1:n
            A(i) = nextState (A,E,i);
        end
    
      %disp( 'State Vector :');
      % disp(A(24));
      
end

finalConceptValue = A(23);
finalValues(numOfPatients+1) = finalConceptValue;
numberOfRecords(numOfPatients+1) = numOfPatients;

    hold on;
    x=finalValues(numOfPatients+1);
    y=numberOfRecords(numOfPatients+1);
    
    if (knownDentalCaries == 0.75)
        plot(x,y,'rs','LineWidth',5,'MarkerSize',2);
    end
    if (knownDentalCaries == 0.25)
        plot(x,y,'c*','LineWidth',5,'MarkerSize',2);
    end


end

