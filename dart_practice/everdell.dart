import 'dart:io';

class GameInfo {
  List<String> userNames = [];
  List<Map<String, int>> userScore = [];
  String dateTime = "";

  //String gameVersion;

  //User(this.name, this.score, this.gameVersion);

  List get getUserName {
    return userNames;
  }

  List<Map<String, int>> get getScore {
    return userScore;
  }

  String get getDateTime {
    return dateTime;
  }

  set setUserName(List<String> playerList) {
    userNames = playerList;
  }

  set setUserScore(List<Map<String, int>> score) {
    userScore = score;
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
  Map<String, int> score = {
    "baseCardPoints": 0,
    "pointTokens": 0,
    "prosperityBonusCardPoints": 0,
    "jurneyPoints": 0,
    "events": 0
  };
  List<Map<String, int>> scoreList = [];

  inputNamesAndScores(playerList, game, score, scoreList);

  writeResults(game);

  print(game);
}

void writeResults(GameInfo game) {
  var resultsFile = File('results.txt');
  var sink = resultsFile.openWrite(mode: FileMode.append);
  sink.write("\n $game");
  sink.close();
}

void inputNamesAndScores(List<String> playerList, GameInfo game,
    Map<String, int> score, List<Map<String, int>> scoreList) {
  print("How many players are in your game?");
  int numberOfPlayers = int.parse(stdin.readLineSync()!);

  for (int player = 0; player <= numberOfPlayers - 1; player++,) {
    print("Player ${player + 1}, enter your name");
    String playerName = stdin.readLineSync()!;
    playerList.add(playerName);
    game.setUserName = playerList;

    inputPoints(playerName, score);
    scoreList.add(score);
    game.setUserScore = scoreList;
    //game.setUserScore = score;
  }
}

void inputPoints(String playerName, Map<String, int> score) {
  print("$playerName, enter your points");
  print("Base points for cards:"); //baseCardPoints
  int base = int.parse(stdin.readLineSync()!);
  score["baseCardPoints"] = base;
  print("Point tokens:"); //pointTokens
  int token = int.parse(stdin.readLineSync()!);
  score["pointTokens"] = token;
  print("Prosperity card bonus points:"); //prosperityBonusCardPoints
  int prosperity = int.parse(stdin.readLineSync()!);
  score["prosperityBonusCardPoints"] = prosperity;
  print("Journey points:"); //journeyPoints
  int journey = int.parse(stdin.readLineSync()!);
  score["Journey points"] = journey;
  print("Events:"); //events
  int event = int.parse(stdin.readLineSync()!);
  score["events"] = event;
}
