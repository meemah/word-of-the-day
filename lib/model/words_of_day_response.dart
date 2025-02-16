import 'dart:convert';

WordsOfDayListResponse wordsOfDayListResponseFromJson(String str) =>
    WordsOfDayListResponse.fromJson(json.decode(str));

String wordsOfDayListResponseToJson(WordsOfDayListResponse data) =>
    json.encode(data.toJson());

class WordsOfDayListResponse {
  List<WordOfDay> list;

  WordsOfDayListResponse({
    required this.list,
  });

  factory WordsOfDayListResponse.fromJson(Map<String, dynamic> json) =>
      WordsOfDayListResponse(
        list: List<WordOfDay>.from(
            json["list"].map((x) => WordOfDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class WordOfDay {
  String definition;
  String date;
  String permalink;
  int thumbsUp;
  String author;
  String word;
  int defid;
  String currentVote;
  DateTime writtenOn;
  String example;
  int thumbsDown;

  WordOfDay({
    required this.definition,
    required this.date,
    required this.permalink,
    required this.thumbsUp,
    required this.author,
    required this.word,
    required this.defid,
    required this.currentVote,
    required this.writtenOn,
    required this.example,
    required this.thumbsDown,
  });

  factory WordOfDay.fromJson(Map<String, dynamic> json) => WordOfDay(
        definition: json["definition"],
        date: json["date"],
        permalink: json["permalink"],
        thumbsUp: json["thumbs_up"],
        author: json["author"],
        word: json["word"],
        defid: json["defid"],
        currentVote: json["current_vote"],
        writtenOn: DateTime.parse(json["written_on"]),
        example: json["example"],
        thumbsDown: json["thumbs_down"],
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "date": date,
        "permalink": permalink,
        "thumbs_up": thumbsUp,
        "author": author,
        "word": word,
        "defid": defid,
        "current_vote": currentVote,
        "written_on": writtenOn.toIso8601String(),
        "example": example,
        "thumbs_down": thumbsDown,
      };
}
