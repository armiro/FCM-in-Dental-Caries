function y = nextState (stateVector , E, i)
  
    myState = 0;
    temp = size(E);
    n = temp(1,1);
    for j=1:n
        myState = myState + ( stateVector(j) * E(j,i) );
    end 
    thisState = stateVector(i);
    finalState = thisState + myState;
    y = sigmoid (finalState);
    
end