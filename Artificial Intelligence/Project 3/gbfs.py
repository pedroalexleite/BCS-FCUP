from node import *
from utils import *
import heapq


def gbfs(inicio, fim):
    firstcost = outoforder(inicio, fim)
    curnode = Node(inicio, 0, "", firstcost)
    visited = set()

    while True:

        name = curnode.return_name()

        if name in visited:
            continue

        visited.add(name)

        cur = curnode.cur.copy()
        depth = curnode.depth
        path = curnode.path

        if cur == fim:
            return path

        options = can_move(cur)

        heap = []
        heapq.heapify(heap)
        for option in options:
            next = sucessores(cur, option)
            #cost = manhattan(next, fim)
            cost = outoforder(next, fim)
            heapq.heappush(heap, Node(next, depth + 1, path + option, cost))

        curnode = heapq.heappop(heap)

    return "something bad happened"
