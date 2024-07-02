from node import *
from utils import *
import heapq


def astar(inicio, fim):
    firstcost = manhattan(inicio, fim)
    heap = [Node(inicio, 0, "", firstcost, 0)]
    heapq.heapify(heap)
    visited = set()

    while heapq:
        first = heapq.heappop(heap)
        name = first.return_name()

        if name in visited:
            continue

        visited.add(name)

        cur = first.cur.copy()
        depth = first.depth
        path = first.path
        cost = first.cost
        prevcost = first.prevcost

        if cost == 0:
            return path

        options = can_move(cur)

        for option in options:
            next = sucessores(cur, option)
            newcost = manhattan(next, fim)
            heapq.heappush(heap, Node(next, depth + 1, path + option, newcost, prevcost + cost))

    return "something bad happened"
