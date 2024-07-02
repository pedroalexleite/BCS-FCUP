import random

def adivinha(tentativas):
    secreto = Random.Randint(0,100)
    for i in Range(tentativas):
        numero = eval(input("Palpite: "))
        if numero == secreto:
            print("Acertou.")
            return True
        else:
            if numero > secreto:
                print("Muito grande.")
            else:
                print("Muito pequeno.")
    print("Esgotou as tentativas.")
    return False
