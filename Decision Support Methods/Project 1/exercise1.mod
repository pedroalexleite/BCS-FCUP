#glpsol -m ex1.mod -d ex1.dat -o ex1.sol
set GAS;
set CRUDE;
set PRODUCTS;

param advertising_demand;
param prod_capacity;
param advertising_price;
param distillary_price;
param refinement_price;

param sales_price{GAS};
param gas_octane{GAS};
param demand{GAS};

param purchase_quan{CRUDE};
param purchase_price{CRUDE};
param naphtha{CRUDE};
param oil{CRUDE};

param octane_rating{PRODUCTS};

var x{i in PRODUCTS, j in GAS} >= 0; # barrels of naphtha and oil i used to produce gas j
var a{j in GAS} >= 0;                # money spent for each gas in ads
var c{k in CRUDE} >= 0;              # barrels of each crude
var total_naphtha;                   # total of naphtha produced
var total_oil;                       # total of oil produced
var purchase_cost;                   # cost to purchase all the crudes
var distillary_cost;                 # cost for the distillation of all the crudes
var refinement_cost;                 # cost for the refinement of all the input (oil and naphtha)
var advertising_cost;                # cost for advertising all the gas
var total_cost;                      # how much did the company spent
var revenue;                         # how much did the money the company generated

maximize profit: revenue - total_cost;

LMT_ {k in CRUDE}: c[k] <= 5000;           # limit of amount of barrels per crude we can buy
LMT_DISTILL: sum {k in CRUDE} c[k] <= prod_capacity;  # limit of how much can the distillary process

OIL_LMT: sum {k in GAS} x['O',k] <= total_oil;         # cant use more oil than the one distilled
NAPHTHA_LMT: sum {k in GAS} x['N',k] <= total_naphtha; # cant use more naphtha than the one distilled

OCTANE {j in GAS}: sum {i in PRODUCTS} octane_rating[i] * x[i,j] >= gas_octane[j] * sum {i in PRODUCTS} x[i,j]; # each gas must have at least some gas_octane
DEMAND {j in GAS}: sum {i in PRODUCTS} x[i,j] = demand[j] + advertising_price * a[j]; # we can't sell more than the demand plus the add generated demand

TN: total_naphtha = sum {k in CRUDE} c[k] * naphtha[k];
TO: total_oil     = sum {k in CRUDE} c[k] * oil[k];
PC: purchase_cost    = sum {k in CRUDE} c[k] * purchase_price[k];
DC: distillary_cost  = sum {k in CRUDE} c[k] * distillary_price;
RC: refinement_cost  = sum {j in GAS, i in PRODUCTS} x[i,j] * refinement_price;
AC: advertising_cost = sum {j in  GAS} a[j] * advertising_price;
TC: total_cost       = purchase_cost + distillary_cost + refinement_cost + advertising_cost;
RV: revenue          = sum {j in GAS, i in PRODUCTS} x[i,j] * sales_price[j];
