class Node:
    def __init__(self, cur, depth, path, cost=0, prevcost=0):
        self.cur = cur.copy()
        self.depth = depth
        self.path = path
        self.cost = cost
        self.prevcost = prevcost

    def __lt__(self, other):
        return (self.cost + self.prevcost) < (other.cost + other.prevcost)

    def return_name(self):
        out = ''
        for i in range(16):
            out += str(self.cur[i]) + " "

        return out

    def print_node(self):
        print('---')
        print("cur: " + str(self.cur))
        print("depth: " + str(self.depth))
        print("path: " + str(self.path))
        if self.cost is not None:
            print("cost: " + str(self.cost))
        if self.prevcost is not None:
            print("prevcost: " + str(self.prevcost))

        print('---')
