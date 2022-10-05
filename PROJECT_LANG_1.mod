set Plants;
set Markets;

# Capacity of plant p in cases
param Capacity{p in Plants};

# Demand at market m in cases
param Demand{m in Markets};

# Distance in thousands of miles
param Distance{Plants, Markets};

# Freight in dollars per case per thousand miles
param Freight;

# Transport cost in thousands of dollars per case
param TransportCost{p in Plants, m in Markets} :=
	Freight * Distance[p, m] / 1000;

# Shipment quantities in cases
var shipment{Plants, Markets} >= 0;

# Total transportation costs in thousands of dollars
minimize cost:
	sum{p in Plants, m in Markets} TransportCost[p, m] * shipment[p, m];

# Observe supply limit at plant p
s.t. supply{p in Plants}: sum{m in Markets} shipment[p, m] <= Capacity[p];

# Satisfy demand at market m
s.t. demand{m in Markets}: sum{p in Plants} shipment[p, m] >= Demand[m];

data;

set Plants := seattle san-diego;
set Markets := new-york chicago topeka;

param Capacity :=
	seattle   350
	san-diego 600;

param Demand :=
	new-york 325
	chicago  300
	topeka   275;

param Distance : new-york chicago topeka :=
	seattle        2.5      1.7     1.8
	san-diego      2.5      1.8     1.4;

param Freight := 90;

# I don't know how to make a recognizable, linguist detectable Hello World program in AMPL, so I used the sample that worked best for this project language file
# I decided to make AMPL the main project language file for this project (seanpm2001/Learn-AMPL/) as AMPL is the main language this project is aiming to compile

# File info
# File type: AMPL source file (*.mod *.dat *.run)
# File version: 1 (2022, Tuesday, October 4th at 10:20 pm PST)
# Line count (including blank lines and compiler line): 61
# End of script
