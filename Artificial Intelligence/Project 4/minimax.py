from utils import *
import random
import math

def max_player(board, depth):
    terminal = solvable(board) or draw(board)

    if depth == 0 or terminal:
        value = utility(board)
        return None, value

    possible = can_play(board)
    temp = random.choice(possible)
    column = int(temp)
    value = -math.inf

    for i in range(len(possible)):
        col = int(possible[i])
        newboard = sucessores(board, col, 'X')
        newvalue = min_player(newboard, depth - 1)[1]

        if newvalue > value:
            value = newvalue
            column = col

    return column, value

def min_player(board, depth):
    terminal = solvable(board) or draw(board)

    if depth == 0 or terminal:
        value = utility(board)
        return None, value

    possible = can_play(board)
    temp = random.choice(possible)
    column = int(temp)
    value = +math.inf

    for i in range(len(possible)):
        col = int(possible[i])
        newboard = sucessores(board, col, 'O')
        newvalue = max_player(newboard, depth - 1)[1]

        if newvalue < value:
            value = newvalue
            column = col

    return column, value
