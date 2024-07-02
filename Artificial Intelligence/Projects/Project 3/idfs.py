from node import *
from utils import *


def idfs(inicio, fim):
    iter = 0
    while True:
        stack = [Node(inicio, 0, "")]
        visited = set()

        while stack:
            top = stack.pop()
            name = top.return_name()

            if name in visited:
                continue

            visited.add(name)

            cur = top.cur.copy()
            depth = top.depth
            path = top.path

            if cur == fim:
                return path

            if depth == iter:
                continue

            options = can_move(cur)

            for option in options:
                next = sucessores(cur, option)
                stack.append(Node(next, depth + 1, path + option))

        iter += 1
