#glpsol -m ex2.mod -d ex2.dat -o ex2.sol
set GAS;
set CRUDE;
set PRODUCTS;

# "import" the from the .dat
param adv_return;
param adv_price;
param crude_barrel_limit;
param distillary_limit;
param distillary_price;
param refinement_price;
param cracking_limit;
param cracking_price;

param octane_lvl{GAS};
param sales_price_barrel{GAS};
param demand{GAS};

param naphtha{CRUDE};
param oil{CRUDE};
param purchase_price_barrel{CRUDE};

param octane_rating{PRODUCTS};

var x{i in PRODUCTS, j in GAS} >= 0; # barrels of naphtha and oil i used to produce gas j
var a{j in GAS} >= 0;                # money spent for each gas in ads
var c{k in CRUDE} >= 0;              # barrels of each crude
var cracked_oil >= 0;                # barrels of oil cracked
var purchase_cost;                   # cost to purchase all the crudes
var total_naphtha;                   # total of naphtha produced
var total_oil;                       # total of oil produced
var distillary_cost;                 # cost for the distillation of all the crudes
var cracking_cost;                   # cost of catalytic cracking the oil
var refinement_cost;                 # cost for the refinement of all the input (oil and naphtha)
var advertising_cost;                # cost for advertising all the gas
var total_cost;                      # how much did the company spent
var revenue;                         # how much did the money the company generated

maximize profit: revenue - total_cost;

LMT_ {k in CRUDE}: c[k] <= crude_barrel_limit;           # limit of amount of barrels per crude we can buy
LMT_DISTILL: sum {k in CRUDE} c[k] <= distillary_limit;  # limit of how much can the distillary process

TN:     total_naphtha = sum {k in CRUDE} c[k] * naphtha[k];
TO:     total_oil     = sum {k in CRUDE} c[k] * oil[k];

LMT_CRACKED_OIL:  cracked_oil <= total_oil;        # we cant crack more oil than the oil we made in the distillary
LMT_CRACKING_CAP: cracked_oil <= cracking_limit;   # als we cant crack more oil than the limit on the cracking refinery

OIL_LMT:        sum {j in GAS} x['OIL',j] <= total_oil - cracked_oil;          # cant use more oil than the one distilled minus the oil cracked
NAPHTHA_LMT:    sum {j in GAS} x['NAPHTHA',j] <= total_naphtha;                # cant use more naphtha than the one distilled
CRACKEDGAS_LMT: sum {j in GAS} x['CRACKEDGAS',j] <= cracked_oil;               # cant use more cracked than the one cracked

OCTANE {j in GAS}:
   sum {i in PRODUCTS} octane_rating[i] * x[i,j] >= octane_lvl[j] * sum {i in PRODUCTS} x[i,j]; # each gas must have at least some octane_lvl

DEMAND {j in GAS}:
   sum {i in PRODUCTS} x[i,j] = demand[j] + adv_return * a[j]; # we can't sell more than the demand plus the add generated demand

PC: purchase_cost    = sum {k in CRUDE} c[k] * purchase_price_barrel[k];
DC: distillary_cost  = sum {k in CRUDE} c[k] * distillary_price;
CC: cracking_cost    = cracked_oil * cracking_price;
RC: refinement_cost  = sum {j in GAS, i in PRODUCTS} x[i,j] * refinement_price;
AD: advertising_cost = sum {j in  GAS} a[j] * adv_price;
TC: total_cost       = purchase_cost + distillary_cost + refinement_cost + advertising_cost;
RV: revenue          = sum {j in GAS, i in PRODUCTS} x[i,j] * sales_price_barrel[j];
