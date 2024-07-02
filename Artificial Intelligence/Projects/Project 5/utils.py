import random

def plur_values(m, examples):
    neg = 0
    pos = 0
    lastcol = len(m[0]) - 1

    for i in range(1, len(examples)):
        if examples[i]:
            if m[i][lastcol] == 'Yes':
                pos += 1
            else:
                neg += 1

    if neg > pos:
        return False
    if neg < pos:
        return True
    if neg == pos:
        return bool(random.getrandbits(1))

    return -1

def allsame(m, examples):
    count = 0
    neg = 0
    pos = 0
    lastcol = len(m[0]) - 1

    for i in range(1, len(examples)):
        count += 1
        if examples[i]:
            if m[i][lastcol] == 'Yes':
                pos += 1
            else:
                neg += 1

    if neg == count:
        return 0
    if pos == count:
        return 1
    return 2

def atribs_empty(atribs):
    flag = 1

    for i in range(len(atribs)):
        if atribs[i] == 1:
            flag = 0
            break
    return bool(flag)

def dif_values(atrib, m):
    temp = []
    flag = 0
    for i in range(1, len(m)):
        size = len(temp)
        for j in range(size):
            if temp[j] == m[i][atrib]:
                flag = 1
        if flag == 1:
            flag = 0
        else:
            temp.append(m[i][atrib])
    return temp

def atrib_examples(m, value, examples, a):
    v = []
    for i in range(1, len(m)):
        if examples[i]:
            if m[i][a] == value:
                v.append(i)

    return v
