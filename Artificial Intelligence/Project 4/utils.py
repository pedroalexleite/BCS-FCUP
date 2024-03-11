import numpy as np

def can_play(cur):
    pos = ""
    for i in range(7):
        if cur[0][i] == '-':
            pos += str(i)

    return pos

def sucessores(cur, pos, player):
    curcopy = np.copy(cur)
    for i in range(6):
        if curcopy[5 - i][pos] == '-':
            curcopy[5 - i][pos] = player
            break

    return curcopy

def direita(cur, i, j, k, ch):
    if k == 0:
        return True
    if j == 7:
        return False
    if ch == cur[i][j]:
        return True and direita(cur, i, j + 1, k - 1, ch)
    else:
        return False

def cima(cur, i, j, k, ch):
    if k == 0:
        return True
    if i == -1:
        return False
    if ch == cur[i][j]:
        return True and cima(cur, i - 1, j, k - 1, ch)
    else:
        return False

def diabaixo(cur, i, j, k, ch):
    if k == 0:
        return True
    if i == 6 or j == 7:
        return False
    if ch == cur[i][j]:
        return True and diabaixo(cur, i + 1, j + 1, k - 1, ch)
    else:
        return False

def diacima(cur, i, j, k, ch):
    if k == 0:
        return True
    if i == -1 or j == 7:
        return False
    if ch == cur[i][j]:
        return True and diacima(cur, i - 1, j + 1, k - 1, ch)
    else:
        return False

def solvable(cur):
    temp = False

    for i in range(6):
        for j in range(7):
            if cur[i][j] != '-':
                temp = direita(cur, i, j, 4, cur[i][j]) \
                       or cima(cur, i, j, 4, cur[i][j]) \
                       or diabaixo(cur, i, j, 4, cur[i][j]) or diacima(cur, i, j, 4, cur[i][j]) or temp

    return temp

def conta(countx, counto):
    if counto == 3 and countx == 0:
        return -50
    if counto == 2 and countx == 0:
        return -10
    if counto == 1 and countx == 0:
        return -1
    if (counto == 0 and countx == 0) or (countx != 0 and counto != 0):
        return 0
    if countx == 3 and counto == 0:
        return 50
    if countx == 2 and counto == 0:
        return 10
    if countx == 1 and counto == 0:
        return 1
    if counto == 4:
        return -512

    return 512

def right_utility(cur, i, j):
    countx = 0
    counto = 0

    for k in range(4):
        if cur[i][j + k] == 'O':
            counto += 1
        if cur[i][j + k] == 'X':
            countx += 1

    return conta(countx, counto)

def up_utility(cur, i, j):
    countx = 0
    counto = 0

    for k in range(4):
        if cur[i - k][j] == 'O':
            counto += 1
        if cur[i - k][j] == 'X':
            countx += 1

    return conta(countx, counto)

def upright_utility(cur, i, j):
    countx = 0
    counto = 0

    for k in range(4):
        if cur[i - k][j + k] == 'O':
            counto += 1
        if cur[i - k][j + k] == 'X':
            countx += 1

    return conta(countx, counto)

def downright_utility(cur, i, j):
    countx = 0
    counto = 0

    for k in range(4):
        if cur[i + k][j + k] == 'O':
            counto += 1
        if cur[i + k][j + k] == 'X':
            countx += 1

    return conta(countx, counto)

def utility(cur):
    soma = 0
    for i in range(6):
        for j in range(7):

            if j <= 3:
                temp = right_utility(cur, i, j)
                if temp == 512 or temp == -512:
                    return temp
                soma += temp
            if i >= 3:
                temp = up_utility(cur, i, j)
                if temp == 512 or temp == -512:
                    return temp
                soma += temp
            if i >= 3 and j <= 3:
                temp = upright_utility(cur, i, j)
                if temp == 512 or temp == -512:
                    return temp
                soma += temp
            if i <= 2 and j <= 3:
                temp = downright_utility(cur, i, j)
                if temp == 512 or temp == -512:
                    return temp
                soma += temp

    if draw(cur):
        return 0

    return soma

def draw(cur):
    flag = True

    for i in range(6):
        for j in range(7):
            if cur[i][j] == '-':
                flag = False

    return flag
