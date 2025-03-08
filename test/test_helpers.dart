import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:wotd/model/words_of_day_response.dart';
import 'package:wotd/repository/word_repository.dart';
import 'package:wotd/service/api_service.dart';

@GenerateMocks([
  IWordRepository,
  IApiService,
  DioException,
])
WordsOfDayListResponse mockWordsOfDayListResponse =
    WordsOfDayListResponse(list: [
  WordOfDay(
      definition: "definition",
      permalink: "permalink",
      thumbsUp: 10,
      author: "author",
      word: "word",
      currentVote: "cu10rrentVote",
      writtenOn: DateTime.now(),
      example: "example",
      thumbsDown: 10)
]);
WordsOfDayListResponse mockEmptyWordsOfDayListResponse =
    WordsOfDayListResponse(list: []);
void main() {}
