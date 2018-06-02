function y = nextState (stateVector , E, i)
  
    myState = 0;
    %temp = size(E);
    %n = temp(1,1);
    n = 23;
    
    for j=1:n
        if (j ~= i)
            myState = myState + ( stateVector(j) * E(((n-1)*(j-1))+i));
        end
    end 
    thisState = stateVector(i);
    finalState = thisState + myState;
    y = sigmoid (finalState);
    

end