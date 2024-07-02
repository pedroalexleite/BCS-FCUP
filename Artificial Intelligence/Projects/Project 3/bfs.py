from node import *
from utils import *


def bfs(inicio, fim):
    queue = [Node(inicio, 0, "")]
    visited = set()

    while queue:
        front = queue.pop(0)
        name = front.return_name()

        if name in visited:
            continue

        visited.add(name)

        cur = front.cur.copy()
        depth = front.depth
        path = front.path

        if cur == fim:
            return path

        options = can_move(cur)

        for option in options:
            next = sucessores(cur, option)
            queue.append(Node(next, depth + 1, path + option))

    return "something bad happened"
