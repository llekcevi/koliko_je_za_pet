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

  String time = DateTime.now().toString();
  game.setDateTime = time;

  List<String> playerList = [];
  List<int> score = [];

  inputNamesAndScores(playerList, game, score);

  writeResults(game);

  print(game);
}

void writeResults(GameInfo game) {
  var resultsFile = File('results.txt');
  var sink = resultsFile.openWrite(mode: FileMode.append);
  sink.write("\n $game");
  sink.close();
}

void inputNamesAndScores(
    List<String> playerList, GameInfo game, List<int> score) {
  print("How many players are in your game?");
  int numberOfPlayers = int.parse(stdin.readLineSync()!);

  for (int player = 0; player <= numberOfPlayers - 1; player++,) {
    print("Player ${player + 1}, enter your name");
    String playerName = stdin.readLineSync()!;
    playerList.add(playerName);
    game.setUserName = playerList;

    print("$playerName, what is your score?");
    int playerScore = int.parse(stdin.readLineSync()!);
    score.add(playerScore);
    game.setUserScore = score;
  }
}
