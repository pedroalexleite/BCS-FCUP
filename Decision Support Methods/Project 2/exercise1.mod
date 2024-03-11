#glpsol -m a02-e1.mod -d a02-e1.dat -o a02-e1.sol
#glpsol -m a02-e1.mod -d a02-e1.dat -o a02-e1.sol -w a02-e1.log < a02-e1.run
set TASKS;
set SKILLS;
set CODERS;

param r {i in SKILLS, k in TASKS} default 0;   # requirements for skill i in task k (in hours)
param s {i in SKILLS, k in TASKS} := if r[i,k] = 0 then 0 else 1;  # incidence matrix: 1 if r>0, else 0
param a {i in SKILLS, j in CODERS} default 0;  # incidence matrix: 1 if coder j has skill i
param t {j in CODERS};               # number of hours available for coder j
param c {j in CODERS};               # hourly cost expected by coder j
param v {k in TASKS};                # value received if task k is completed
param d {i in SKILLS, j in CODERS} default 0;  # skill evaluation for each of the coders

var x {j in CODERS, k in TASKS} binary;                  # 1 if task k is done by j
var y {k in TASKS} binary;                               # 1 if all skills of task k are completed
var profit;
var skill;

maximize profit_obj: profit;

subject to

PROFIT: profit =
        sum {k in TASKS} v[k] * y[k] - sum {i in SKILLS, j in CODERS, k in TASKS} c[j] * r[i,k] * x[j,k];

TIME {j in CODERS}:
        sum {i in SKILLS, k in TASKS} r[i,k] * x[j,k] <= t[j];

ABILITY {i in SKILLS, j in CODERS, k in TASKS : r[i,k] > 0}:
        x[j,k] <= a[i,j];

COVER {k in TASKS}:
        sum {j in CODERS} x[j,k] >= y[k];

SKILL: skill = sum {i in SKILLS, j in CODERS, k in TASKS} s[i,k] * d[i,j] * x[j,k];
