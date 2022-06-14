# Rock paper scissors game with the computer

import random

player_score = 0
computer_score = 0
game_count = 0


def play_game():
    global player_score
    global computer_score
    global game_count
    choice = ["rock", "paper", "scissors"]  # a list of possible moves

    # variable player stores players move, variable computer stores computers move
    player = ""
    while player not in choice:     # checks that player entered only the moves that are allowed
        player_choice = input(
            f"\n {player_name}, do you chose rock, paper or scissors? \n ")
        player = player_choice.lower()  # transforms player's move in a lowercase string
    computer = random.choice(choice)
    print("Computer chooses " + computer)

    # comparing moves the players have entered
    if player == computer:
        print("It's a draw.")
    elif (player == "scissors" and computer == "paper") or \
            (player == "paper" and computer == "rock") or \
            (player == "rock" and computer == "scissors"):
        print(f"{player_name} wins!")
        player_score += 1
    else:
        print("Computer wins!")
        computer_score += 1
    game_count += 1


print("\n ROCK PAPER SCISSORS \n ")

# asks for player's name
player_name = input("What is your name? \n")
# with open(f"{player_name}.txt", "a") as username:      ! upis u tekst fajl
#    username.write(f"USERNAME: {player_name}")


# boolean for repeating the game
again = True
# game
play_game()
# while loop for repeating the game
while again:
    repeat = input(
        f"{player_name}, do you want to play again? (Type yes or no.) \n")
    if repeat == "no":
        again = False
        print("\n Game ended. \n")
        print("Computer won " + f"{computer_score} out of {game_count} games.")
        print(f"{player_name} won {player_score} out of {game_count} games. \n")

    else:
        play_game()
