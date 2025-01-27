# Sets
set FARMS;
set CROPS;

# Parametros
param area{FARMS} >= 0;
param water{FARMS} >= 0;
param crop_max_area{CROPS} >= 0;
param crop_water_consumption{CROPS} >= 0;
param crop_profit{CROPS} >= 0;

var planted_area{FARMS, CROPS} >= 0;

# Funcao Objetivo
maximize total_profit: 
    sum{i in FARMS, j in CROPS} crop_profit[j] * planted_area[i,j];

# Constraints
subject to water_constraint{i in FARMS}:
    sum{j in CROPS} crop_water_consumption[j] * planted_area[i,j] <= water[i];

subject to area_constraint{i in FARMS}:
    sum{j in CROPS} planted_area[i,j] <= area[i];

subject to crop_area_constraint{j in CROPS}:
    sum{i in FARMS} planted_area[i,j] <= crop_max_area[j];

# Constraint de proporcionaldade
subject to proportionality_constraint{i in FARMS, j in CROPS, k in FARMS, w in CROPS}:
    planted_area[i,j] / area[i] = planted_area[k,w] / area[k];
