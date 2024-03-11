from utils import *
from minimax import *
from alphabeta import *

def one_player(board, depth, player, escolha):
    while not solvable(board):
        if player:
            if escolha:
                col = max_player(board, depth)[0]
                board = sucessores(board, col, 'X')
            else:
                col = max_alpha(board, depth, -math.inf, +math.inf)[0]
                board = sucessores(board, col, 'X')

            player = 0

        else:
            for i in range(6):
                for j in range(7):
                    print(board[i][j], end=" ")
                print()
            print("Escolha um coluna para jogar de 0 a 6")
            pcol = int(input())

            while True:
                flag = 0
                s = can_play(board)
                for i in range(len(s)):
                    if pcol == int(s[i]):
                        flag = 1
                if flag == 1:
                    break
                print("Erro: Não é possível jogar nessa coluna. Escolha outra")
                pcol = int(input())
            board = sucessores(board, pcol, 'O')
            player = 1

    for i in range(6):
        for j in range(7):
            print(board[i][j], end=" ")
        print()

    if draw(board):
        print("É Empate")
        return
    temp = utility(board)
    if temp == 512:
        print("O computador ganhou!")
        return
    if temp == -512:
        print("O Jogador ganhou!")
        return

def two_players(board):
    player = 1
    while not solvable(board):
        for i in range(6):
            for j in range(7):
                print(board[i][j], end=" ")
            print()

        if player:
            print("Jogador 1 escolha um coluna para jogar")
            pcol = int(input())

            while True:
                flag = 0
                s = can_play(board)
                for i in range(len(s)):
                    if pcol == int(s[i]):
                        flag = 1
                if flag == 1:
                    break
                print("Erro: Não é possível jogar nessa coluna. Escolha outra")
                pcol = int(input())
            board = sucessores(board, pcol, 'X')
            player = 0
        else:
            print("Jogador 2 escolha um coluna para jogar")
            pcol = int(input())

            while True:
                flag = 0
                s = can_play(board)
                for i in range(len(s)):
                    if pcol == int(s[i]):
                        flag = 1
                if flag == 1:
                    break
                print("Erro: Não é possível jogar nessa coluna. Escolha outra")
                pcol = int(input())
            board = sucessores(board, pcol, 'O')
            player = 1

    for i in range(6):
        for j in range(7):
            print(board[i][j], end=" ")
        print()

    if draw(board):
        print("É Empate")
        return
    temp = utility(board)
    if temp == 512:
        print("O Jogador 1 ganhou!")
        return
    if temp == -512:
        print("O Jogador 2 ganhou!")
        return
