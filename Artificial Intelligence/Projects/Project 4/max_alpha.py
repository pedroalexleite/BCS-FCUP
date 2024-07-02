from utils import *
import random
import math

def max_alpha(board, depth, alpha, beta):
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
        newvalue = min_beta(newboard, depth - 1, alpha, beta)[1]

        if newvalue > value:
            value = newvalue
            column = col

        if value >= beta:
            return column, value
        alpha = max(alpha, value)

    return column, value

def min_beta(board, depth, alpha, beta):
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
        newvalue = max_alpha(newboard, depth - 1, alpha, beta)[1]

        if newvalue < value:
            value = newvalue
            column = col

        if value <= alpha:
            return column, value
        beta = min(beta, value)

    return column, value
