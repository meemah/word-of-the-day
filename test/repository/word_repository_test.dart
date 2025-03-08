import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wotd/model/words_of_day_response.dart';
import 'package:wotd/repository/word_repository.dart';

import '../test_helpers.dart';
import '../test_helpers.mocks.dart';

void main() {
  late MockIApiService apiService;
  late WordRepository wordRepository;
  setUp(() async {
    apiService = MockIApiService();
    wordRepository = WordRepository(apiService: apiService);
  });
  group("Given WordRepository, test the methods", () {
    test(
        "Given getWordOfDay, when ApiService fails,then an exception should be thrown",
        () async {
      when(apiService.get("/random"))
          .thenAnswer((_) => throw MockDioException());

      expect(
          wordRepository.getWordOfTheDay(), throwsA(isA<MockDioException>()));
    });
  });

  test(
      "Given getWordOfDay, when ApiService is successful, return WordsOfDayListResponse",
      () async {
    when(apiService.get("/random"))
        .thenAnswer((_) => Future.value(mockWordsOfDayListResponse.toJson()));
    var response = await wordRepository.getWordOfTheDay();
    expect(response, isA<WordsOfDayListResponse>());
  });
}
