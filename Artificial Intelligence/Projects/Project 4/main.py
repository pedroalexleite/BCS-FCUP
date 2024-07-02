from extra import *

mat = [[0 for i in range(7)] for j in range(6)]

for i in range(6):
    for j in range(7):
        mat[i][j] = '-'

print("Escreva o número consoante o modo de jogo que pretende jogar")
print("Jogar Contra o Computador - 1")
print("Jogarem 2 Jogadores - 2")

flag = int(input())

if flag == 1:
    print("Pretende que o computador utilize o algoritmo alpha-beta (0) ou o minimax (1)")
    escolha = int(input())
    if escolha:
        print("Escolha a dificuldade: Fácil (0) - Difícil (1)")
        i_depth = int(input())
        if i_depth == 0:
            depth = 3
        else:
            depth = 5
    else:
        print("Escolha a dificuldade: Fácil (0) - Intemédio (1) - Difícil (2)")
        i_depth = int(input())
        if i_depth == 0:
            depth = 3
        elif i_depth == 1:
            depth = 5
        else:
            depth = 6
    print("Quem começa primeiro? Jogador (0) ou Computador (1)")
    first = int(input())
    one_player(mat, depth, first, escolha)
else:
    two_players(mat)
