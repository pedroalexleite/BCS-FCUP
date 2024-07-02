from dfs import *
from bfs import *
from idfs import *
from gbfs import *
from astar import *

inicio = list(map(int, input().strip().split()))
fim = list(map(int, input().strip().split()))

if solvable(inicio, fim):
    print(dfs(inicio, fim))
