from utils import *

new_mat = [[0 for i in range(4)] for j in range(4)]

new_mat[1][1] = '?'
new_mat[2][1] = 'No'
new_mat[3][1] = 'No'
examples = [0, 1, 1, 1]
#for i in range(2):
#    for j in range(2):
#        print(new_mat[i][j])
#    print()
#print(str(plur_values(new_mat, examples)))
temp = atrib_examples(new_mat, 0, examples, 2)
#temp = dif_values(1, new_mat)
for i in range(len(temp)):
    print(temp[i])
