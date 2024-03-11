#glpsol -m a02-e3.mod -d a02-e3.dat -o a02-e3.sol
#glpsol -m a02-e3.mod -d a02-e3.dat -o a02-e3.sol -w a02-e3.log < a02-e3.run
set TASKS;
set SKILLS;
set CODERS;

param r {i in SKILLS, k in TASKS} default 0;   # requirements for skill i in task k (in hours)
param a {i in SKILLS, j in CODERS} default 0;  # incidence matrix: 1 if coder j has skill i
param t {j in CODERS};               # number of hours available for coder j
param c {j in CODERS};               # hourly cost expected by coder j
param v {k in TASKS};                # value received if task k is completed
param d {i in SKILLS, j in CODERS} default 0;  # skill evaluation for each of the coders

var x {i in SKILLS, j in CODERS, k in TASKS} >= 0;     # hours spent on skill i of task k by coder j
var w {j in CODERS, k in TASKS} binary;                # 1 coder j is if hours spent on skill i of task k by
var y {k in TASKS} binary;                             # 1 if all skills of task k are completed
var z >= 0;                                            # number of persons in the largest team
var profit;


subject to

PROFIT: profit = sum {k in TASKS} v[k] * y[k] - sum {i in SKILLS, j in CODERS, k in TASKS} c[j] * x[i,j,k];

TIME {j in CODERS}:
        sum {i in SKILLS, k in TASKS} x[i,j,k] <= t[j];

ABILITY {i in SKILLS, j in CODERS, k in TASKS : a[i,j]=0}:
        x[i,j,k] = 0;   # not necessary, but may help tightening formulation

IS_IN_TASK {j in CODERS, k in TASKS}:
        sum {i in SKILLS} x[i,j,k] <= t[j] * w[j,k];

TEAM_SIZE {k in TASKS}:
        z >= sum {j in CODERS} w[j,k];

COVER {i in SKILLS, k in TASKS}:
        sum {j in CODERS} x[i,j,k] >= r[i,k] * y[k];

minimize z_obj: z;
maximize profit_obj: profit;
