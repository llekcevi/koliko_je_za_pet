import 'dart:io';

class User {
  String name;
  int score;
  String gameVersion;

  User(this.name, this.score, this.gameVersion);

  @override
  String toString() {
    return "User($name, $score, $gameVersion)";
  }
}

void main() {
  print("How many players are in your game?");
  int numberOfPlayers = int.parse(stdin.readLineSync()!);

  List<String> playerList = [];

  for (int player = 0; player <= numberOfPlayers - 1; player++,) {
    print("Enter your name");
    print(player);
    var playerName = stdin.readLineSync()!;
    playerList.add(playerName);
    print(playerList);
  }

  /*
  print("Enter your name:");
  String userName = stdin.readLineSync()!;

  print("Enter your score:");
  int userScore = int.parse(stdin.readLineSync()!);

  print("We currently support only Everdell base game");
  String gameVersion = "Everdell, base game";

  User user1 = User(userName, userScore, gameVersion);

  print("you are $userName");

  print(user1);
  */
}
