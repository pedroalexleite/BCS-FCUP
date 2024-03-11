import random, pygame

TILESIZE = 77.5

class player:
    def __init__(self, name, x, y):
        self.name = name
        (self.x, self.y) = (x,y)
        (self.hx, self.hy) = (0,0)
        self.points = 0
        self.rounds = 1
        self.coord = 0
        self.sign = 1
        self.arrow = 1
        self.dire = 1

def get_player(curP):
    if curP == 1:
        #print("returned p1")
        return player1                 
    elif curP == 2:
        #print("returned p2")
        return player2
    elif curP == 3:
        #print("returned p3")
        return player3                     
    elif curP == 4:
        #print("returned p4")
        return player4

def switch_direction(player):
    player.arrow += 1

    if player.arrow % 3 == 0:
        player.sign = -player.sign
        player.arrow = 1
            
    player.dire = -player.dire
    player.coord = 0

def move_player(player, tiles):
    #print("{} coord_val -> {}".format(player.name,player.coord))
    
    if player.coord  + tiles >= 7:
        # mover ate borda
        left_to_board = 7 - player.coord
        if player.dire == 1:
            player.hx += left_to_board
            player.x += player.sign*TILESIZE*(left_to_board)
        elif player.dire == -1:
            player.hy += left_to_board
            player.y += player.sign*TILESIZE*(left_to_board)

        switch_direction(player)

        # mover resto das casas
        player.coord = tiles - left_to_board
        if player.dire == 1:
            player.hx = player.coord
            player.x += player.sign*TILESIZE*(player.coord)
        elif player.dire == -1:
            player.hy = player.coord
            player.y += player.sign*TILESIZE*(player.coord)
    else:
        if player.dire == 1:
            player.hx += tiles
            player.x += player.sign*TILESIZE*tiles
        elif player.dire == -1:
            player.hy += tiles
            player.y += player.sign*TILESIZE*tiles
        player.coord += tiles
    
    print("{} coord ({},{})".format(player.name, player.hx, player.hy))
          

def get_points(player, diff):
    #print("Current points -> {}".format(player.points))
    if diff == 1 :
        player.points += 3
    elif diff == 2:
        player.points += 5
    elif diff == 3:
        player.points += 8
    elif diff == 4:
        player.points += 12
    
    if player.points >= 100:
        player.points = 100

player1 = player("Player1", 175, 5)
player2 = player("Player2", 215, 5)
player3 = player("Player3",175, 40)
player4 = player("Player4",215, 40)