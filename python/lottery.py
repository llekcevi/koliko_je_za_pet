#loto 6/45
import random

loto = []                                                   #two empty lists, one for a wining combination
kombinacija = []                                            #the other for users guess

for i in range (0, 6):                                      #generates a winning combination
    number = random.randint(1,45)
    loto.append(number)
print(loto)

print("Odaberi kombinaciju šest brojeva između 1 i 45.")    #asks for a user input of 6 numbers

for i in range(0,6):
    num = int(input("Broj:"))
    kombinacija.append(num)
print(kombinacija)

pogodak = [x for x in kombinacija if x in loto]             #makes a list of overlapping numbers
print(pogodak)

print(f"Pogodili ste brojeve: {pogodak}" )                  #tells the user what the overlapping numbers are

dobitak = len(pogodak)

if dobitak == 6:                                            #if user chose 6 overlapping numbers, it prints that the user has won
    print("Osvojili ste Loto 6/45!")                        #the lottery