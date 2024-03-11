from node import *
from utils import *

def dfs(inicio, fim):
    stack = [Node(inicio, 0, "")]
    visited = set()

    while stack:
        top = stack.pop()
        name = top.return_name()

        if name in visited:
            continue

        visited.add(name)
        #top.print_node()
        cur = top.cur.copy()
        depth = top.depth
        path = top.path

        if cur == fim:
            return path

        if depth == 20:
            continue

        options = can_move(cur)
        
        for option in options:
            next = sucessores(cur, option)
            stack.append(Node(next, depth + 1, path + option))

    return "something bad happened"
