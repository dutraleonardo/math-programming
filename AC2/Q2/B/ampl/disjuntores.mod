# circuit_breaker.mod
# Decision Variables
var X integer >= 0;  # Number of first type circuit breakers
var Y integer >= 0;  # Number of second type circuit breakers

# Objective Function: Maximize profit
# Revenue: X(15 - 0.63X) + Y(21 - 0.17Y)
# Cost: 1.45X - 1.2Y + 1.15X³Y²
maximize Profit: 
    X*(15 - 0.63*X) + Y*(21 - 0.17*Y) - (1.45*X - 1.2*Y + 1.15*X^3*Y^2);
