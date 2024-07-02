import numpy as np


def outoforder(cur, fim):
    sum = 0
    for i in range(16):
        if cur[i] != fim[i]:
            sum += 1

    return sum

def manhattan(cur, fim):
    mcur = np.array_split(cur, 4)
    mfim = np.array_split(fim, 4)
    sum = 0
    for i in range(4):
        for j in range(4):
            for k in range(4):
                for w in range(4):
                    if mcur[i][j] == mfim[k][w]:
                        sum += abs(i - k) + abs(j - w)

    return sum

def solvable(inicio, fim):
    branco0 = -1
    branco1 = -1
    inv0 = 0
    inv1 = 0

    for i in range(16):
        if inicio[i] == 0:
            branco0 = not(i <= 3 or (8 <= i <= 11))

        if fim[i] == 0:
            branco1 = not(i <= 3 or (8 <= i <= 11))


    for i in range(15):
        for j in range(i + 1, 16):
            if (inicio[i] > inicio[j]) and (inicio[i] != 0 and inicio[j] != 0):
                inv0 += 1

            if (fim[i] > fim[j]) and (fim[i] != 0 and fim[j] != 0):
                inv1 += 1

    case1 = ((inv0 % 2) != branco0) == ((inv1 % 2) != branco1)

    return case1

def sucessores(cur, ch):
    next = [0] * 16

    for i in range(16):
        next[i] = cur[i]

    for i in range(16):
        if cur[i] != 0:
            continue

        if ch == 'C':
            next[i] = cur[i - 4]
            next[i - 4] = 0

        elif ch == 'B':
            next[i] = cur[i + 4]
            next[i + 4] = 0

        elif ch == 'E':
            next[i] = cur[i - 1]
            next[i - 1] = 0

        elif ch == 'D':
            next[i] = cur[i + 1]
            next[i + 1] = 0

    return next

def can_move(cur):
    moves = ""

    for i in range(16):
        if cur[i] != 0:
            continue
        if i >= 4:
            moves += "C"

        if i <= 11:
            moves += "B"

        if i != 0 and i != 4 and i != 8 and i != 12:
            moves += "E"

        if i != 3 and i != 7 and i != 11 and i != 15:
            moves += "D"

    return moves
