import 'dart:io';

class GameInfo {
  List<String> userNames = [];
  List<int> userScore = [];
  String dateTime = "";
  //String gameVersion;

  //User(this.name, this.score, this.gameVersion);

  List get getUserName {
    return userNames;
  }

  set setUserName(List<String> playerList) {
    userNames = playerList;
  }

  List get getScore {
    return userScore;
  }

  set setUserScore(List<int> score) {
    userScore = score;
  }

  String get getDateTime {
    return dateTime;
  }

  set setDateTime(String time) {
    dateTime = time;
  }

  @override
  String toString() {
    return "GameInfo($userNames, $userScore, $dateTime)";
  }
}

void main() {
  GameInfo game = GameInfo();

  print("How many players are in your game?");
  int numberOfPlayers = int.parse(stdin.readLineSync()!);

  String time = DateTime.now().toString();
  game.setDateTime = time;

  List<String> playerList = [];
  List<int> score = [];

  for (int player = 0; player <= numberOfPlayers - 1; player++,) {
    print("Enter your name");
    print(player);
    String playerName = stdin.readLineSync()!;
    playerList.add(playerName);
    game.setUserName = playerList;

    print("$player, what is your score?");
    int playerScore = int.parse(stdin.readLineSync()!);
    score.add(playerScore);
    game.setUserScore = score;
  }

  print(GameInfo());
/*
  User user1 = User();

  print("Enter your name:");
  String name = stdin.readLineSync()!;

  user1.setUserName = name;

  print("Welcome ${user1.getUserName}, current time is $time");

  
  print("Enter your score:");
  int userScore = int.parse(stdin.readLineSync()!);

  print("We currently support only Everdell base game");
  String gameVersion = "Everdell, base game";

  User user1 = User(userName, userScore, gameVersion);

  print("you are $userName");

  print(user1);
  */
}
