import math
from newid3 import *

print("Digite o número do ficheiro que pretende utilizar:")
print("1 - restaurant")
print("2 - iris")
print("3 - weather")

while 1:
    x = input()
    x = int(x)
    if x == 1:
        fr = open("restaurant.csv", "r")
        break
    if x == 2:
        fr = open("iris.csv", "r")
        break
    if x == 3:
        fr = open("weather.csv", "r")
        break

number_columns = 1
while 1:
    char = fr.read(1)
    if char == ',':
        number_columns = number_columns + 1
    if char == '\n':
        break
# print(number_columns)

number_lines = 1
while 1:
    char = fr.read(1)
    if char == '\n':
        number_lines = number_lines + 1
    if char == '':
        break
# print(number_lines)

mat = [[0 for i in range(number_columns)] for j in range(number_lines)]
for i in range(number_lines):
    for j in range(number_columns):
        mat[i][j] = ''

fr.close()

if x == 1:
    fr = open("restaurant.csv", "r")
if x == 2:
    fr = open("iris.csv", "r")
if x == 3:
    fr = open("weather.csv", "r")

i = 0
j = 0
x = fr.read(1)
while x != '':
    if x != ',' and x != '\n':
        mat[i][j] = mat[i][j] + x
    if x == ',':
        j = j + 1
    if x == '\n':
        j = 0
        i = i + 1
    x = fr.read(1)
fr.close()

examples = []
atribs = []

for i in range(1, len(mat)):
    examples.append(1)

for i in range(1, len(mat[0])):
    atribs.append(1)

root = newid3(examples, atribs, examples, mat)
print(root.value)
