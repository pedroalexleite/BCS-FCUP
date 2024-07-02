from utils import *
from nofolha import *
from node import *
from entropy import *

def newid3(examples, atribs, parent_examples, m):
    size = len(examples)
    same = allsame(m, examples)
    a_empty = atribs_empty(atribs)

    if size == 0:
        plur = plur_values(m, parent_examples)
        return nofolha(plur)
    elif same != 2:
        if same == 1:
            return nofolha(True)
        else:
            return nofolha(False)
    elif a_empty == 0:
        plur = plur_values(m, examples)
        return nofolha(plur)
    else:
        A = importance(m, atribs, examples)
        root = node(A, None)

        values = dif_values(m, A)
        array_sub = []

        for value in values:
            new_examples = atrib_examples(m, value, examples, A)
            atribs[A] = 0
            array_sub.append((node(A, newid3(new_examples, atribs, examples, m)), value))

        root.subtree = array_sub

    return root
