import pygame, sys, os
from player import *


###initial loading of global variables and screen/clock
pygame.init()

(WIDTH, HEIGHT) = (960, 720)
(CENTER_X, CENTER_Y) = (WIDTH/2, HEIGHT/2)
(TABLESCALE_X, TABLESCALE_Y) = (131.25, 140)
(CARDSIZE_X, CARDSIZE_Y) = (110,170)
(PLAYERSIZE_X, PLAYERSIZE_Y) = (25, 25)
(CARDPOS_X, CARDPOS_Y) = (370,250)
MULT = 1.55
TILESIZE = 77.5

screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.flip()
pygame.display.set_caption("</Hello World/>")
clock = pygame.time.Clock()


###Loading colours 

BROWN = (203,142,79)
BEIGE = (249, 228, 183)


###Loading font

font = pygame.font.Font("Fonts/m5x7.ttf", 30)


###Loading assets of the game
board_image = pygame.image.load(os.path.join('board', 'board.png'))
board = pygame.transform.scale(board_image, (620,620))

button_image = pygame.image.load(os.path.join('board', 'number_roll.png'))
button = pygame.transform.scale(button_image, (260, 54))

p1_table_image = pygame.image.load(os.path.join('players', 'player_blue_table.png'))
p1_table = pygame.transform.scale(p1_table_image, (TABLESCALE_X,TABLESCALE_Y))

p2_table_image = pygame.image.load(os.path.join('players', 'player_red_table.png'))
p2_table = pygame.transform.scale(p2_table_image, (TABLESCALE_X,TABLESCALE_Y))

p3_table_image = pygame.image.load(os.path.join('players', 'player_green_table.png'))
p3_table = pygame.transform.scale(p3_table_image, (TABLESCALE_X,TABLESCALE_Y))

p4_table_image = pygame.image.load(os.path.join('players', 'player_yellow_table.png'))
p4_table = pygame.transform.scale(p4_table_image, (TABLESCALE_X,TABLESCALE_Y))

ecard_back_image = pygame.image.load(os.path.join('cards', 'ExtremeCard_back.png'))
ecard_back = pygame.transform.scale(ecard_back_image, (CARDSIZE_X,CARDSIZE_Y))

ncard_back_image = pygame.image.load(os.path.join('cards', 'normalCard_back.png'))
ncard_back = pygame.transform.scale(ncard_back_image, (CARDSIZE_X,CARDSIZE_Y))

ncard_easy_image = pygame.image.load(os.path.join('cards', 'normalCard_easyDiff_front.png'))
ncard_easy = pygame.transform.scale(ncard_easy_image, (MULT*CARDSIZE_X,MULT*CARDSIZE_Y))

ncard_medium_image = pygame.image.load(os.path.join('cards', 'normalCard_mediumDiff_front.png'))
ncard_medium = pygame.transform.scale(ncard_medium_image, (MULT*CARDSIZE_X,MULT*CARDSIZE_Y))

ncard_hard_image = pygame.image.load(os.path.join('cards', 'normalCard_hardDiff_front.png'))
ncard_hard = pygame.transform.scale(ncard_hard_image, (MULT*CARDSIZE_X,MULT*CARDSIZE_Y))

ecard_bonus_image = pygame.image.load(os.path.join('cards', 'extremeCard_bonusDiff_front.png'))
ecard_bonus = pygame.transform.scale(ecard_bonus_image, (MULT*CARDSIZE_X,MULT*CARDSIZE_Y))

p1_image = pygame.image.load(os.path.join('players', 'player_blue.png'))
p1 = pygame.transform.scale(p1_image, (PLAYERSIZE_X, PLAYERSIZE_Y))

p2_image = pygame.image.load(os.path.join('players', 'player_red.png'))
p2 = pygame.transform.scale(p2_image, (PLAYERSIZE_X, PLAYERSIZE_Y))

p3_image = pygame.image.load(os.path.join('players', 'player_green.png'))
p3 = pygame.transform.scale(p3_image, (PLAYERSIZE_X, PLAYERSIZE_Y))

p4_image = pygame.image.load(os.path.join('players', 'player_yellow.png'))
p4 = pygame.transform.scale(p4_image, (PLAYERSIZE_X, PLAYERSIZE_Y))
###


def draw_window():
    screen.fill(BEIGE)

    screen.blit(board, (170, 0))
    screen.blit(button, (350, 650))

    screen.blit(p1_table, (10, 100))
    screen.blit(p2_table, (10, 400))
    screen.blit(p3_table, (820, 100)) 
    screen.blit(p4_table, (820, 400))

    screen.blit(ncard_back, (545,225))
    screen.blit(ecard_back, (310,225))

    instructions_space = font.render("[space] Roll Number!", False, (0,0,0))
    instructions_escape = font.render("[escape] Close Game!", False, (0,0,0))
    screen.blit(instructions_space, (10, 670))
    screen.blit(instructions_escape, (10, 690))

    pygame.display.update()

def render_players(player1, player2, player3, player4):
    screen.blit(p1, (player1.x, player1.y))
    screen.blit(p2, (player2.x, player2.y))
    screen.blit(p3, (player3.x, player3.y))
    screen.blit(p4, (player4.x, player4.y))

    pt1 = font.render(str(player1.points), False, 'Black')
    screen.blit(pt1, (69,170))

    pt2 = font.render(str(player2.points), False, 'Black')
    screen.blit(pt2, (69,470))

    pt3 = font.render(str(player3.points), False, 'Black')
    screen.blit(pt3, (880,170))

    pt4 = font.render(str(player4.points), False, 'Black')
    screen.blit(pt4, (880,470))

    pygame.display.update()


def card_screen(diff, tiles, cur_player):
    screen.fill(BEIGE)

    instructions_y = font.render("[y] Answer correct!", False, (0,0,0))
    instructions_n = font.render("[n] Answer wrong!", False, (0,0,0))
    instructions_escape = font.render("[escape] Close Game!", False, (0,0,0)) 
    screen.blit(instructions_y, (10, 650))
    screen.blit(instructions_n, (10, 670))
    screen.blit(instructions_escape, (10, 690))

    cur_player_text = font.render("{} rolled a {}!".format(cur_player.name, tiles), False, (0,0,0))
    screen.blit(cur_player_text, (368, 200))

    diff_text = font.render("Draw Normal Card", False,  (0,0,0))
    screen.blit(diff_text, (370, 550))
    
    if diff == 1:
        screen.blit(ncard_easy, (CARDPOS_X, CARDPOS_Y))
        cur_diff_text = font.render("Diff Easy", False,  (34,139,34))
    if diff == 2:
        screen.blit(ncard_medium, (CARDPOS_X, CARDPOS_Y))
        cur_diff_text = font.render("Diff Medium", False,  (255,131,0))
    if diff == 3:
        screen.blit(ncard_hard, (CARDPOS_X, CARDPOS_Y))
        cur_diff_text = font.render("Diff Hard", False,  (255,17,0))
    if diff == 4:
        screen.blit(ecard_bonus, (CARDPOS_X, CARDPOS_Y))
        cur_diff_text = font.render("Diff Bonus", False,  (120,81,169))

    screen.blit(cur_diff_text, (410, 570))

    pygame.display.update()


def winner_screen(player):
    screen.fill(BEIGE)
    winner = font.render(player.name+ " is the winner!", False, 'Black')
    screen.blit(winner, (CENTER_X-200, CENTER_Y))
    instructions_escape = font.render("[escape] Close Game!", False, (0,0,0))
    screen.blit(instructions_escape, (10, 690))
    pygame.display.update()



elist = [(0,7), (7,7), (0,0), (7,0)]
nlist = [(1,0), (0,1), (2,0), (0,2), (3,0), (4,0), (0,4), (0,5), (7,1), (1,7), (7,2), (2,7), (7,3), (3,7), (4,7), (7,5), (7,6), (6,7)]

switch_state = False
curP = 1
cur_player = player1
current_time = 0
idle = 0
running = True 


while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE:
                pygame.quit()
                sys.exit()
        if cur_player.points == 100:
            winner_screen(cur_player)
        elif switch_state:
            if (cur_player.hx, cur_player.hy) in nlist:
                    diff = random.randint(1,3)
                    card_screen(diff, tiles, cur_player)
                    if event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_y:
                            switch_state = False
                            get_points(cur_player, diff)
                        if event.key == pygame.K_n:
                            switch_state = False

            elif (cur_player.hx, cur_player.hy) in elist:
                    diff = 4
                    card_screen(diff, tiles, cur_player)
                    if event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_y:
                            switch_state = False
                            get_points(cur_player, diff)
                        if event.key == pygame.K_n:
                            switch_state = False
            
            else: switch_state = False 
                      
        else:
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_SPACE:
                    cur_player = get_player(curP)
                    tiles = random.randint(1,6)
                    tiles_txt = font.render(cur_player.name+" moves {} tiles.".format(tiles), False, (0,0,0))
                    screen.blit(tiles_txt, (350, 630))
                    move_player(cur_player, tiles)
                    if curP == 4:
                        curP = 0
                    curP += 1
                    switch_state = True
            draw_window()
            render_players(player1, player2, player3, player4)

        current_time = pygame.time.get_ticks()

    clock.tick(60)
