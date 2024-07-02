import string
import array
import random

def encryption(key, string):
    for i in range(len(string)):
        string2 = " "
        if key <= 25:
            ord = ord(string[i])
            if ((ord >= 65) and (ord <= 90)): #upper
                if ((ord + key) <= 90):
                    string2[i] = chr(ord + key)
                if ((ord + key) > 90):
                    string2[i] = chr(65 + ord + key - 90)
            elif ((ord >= 97) and (ord <= 122)): #lower
                if ((ord + key) <= 122):
                    string2[i] = chr(ord + key)
                if ((ord + key) > 122):
                    string2[i] = chr(97 + ord + key - 122)
            else:
                string2[i] = string[i]
    print(string2)

encryption(3, "ALEX")

#Programa do Pedro:

def encrypt():
    y = 3
    x=input()
    test_string = ''
    for i in range(len(x)):
        cur_index =  ord(x[i])
        cipher = chr(cur_index + y)

        if(x[i].isupper()):
           if(ord(cipher)>ord('Z')):
               dif = ord(cipher)-ord('Z')
               test_string+= chr(65+dif)
           else:
                test_string+= cipher
        else:
            if(ord(cipher)>ord('z')):
               dif = ord(cipher)-ord('z')
               test_string+= chr(97+dif)
            else:
                test_string+= cipher

        print(test_string)

def decrypt():

    message = 'GIEWIVrGMTLIVrHIQS' 
    LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    for key in range(len(LETTERS)):
       translated = ''
       for symbol in message:
          if symbol in LETTERS:
             num = LETTERS.find(symbol)
             num = num - key
             if num < 0:
                num = num + len(LETTERS)
             translated = translated + LETTERS[num]
          else:
             translated = translated + symbol
       print('Hacking key #%s: %s' % (key, translated))



decrypt()
encrypt()
