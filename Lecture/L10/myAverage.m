function avg = myAverage( nums )

global TOTAL % bring TOTAL into function but not through function input

avg = sum( nums ) / TOTAL;

TOTAL = 5;

end