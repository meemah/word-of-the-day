import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:wotd/model/words_of_day_response.dart';
import 'package:wotd/viewmodel/word_viewmodel.dart';

import '../test_helpers.dart';
import '../test_helpers.mocks.dart';

void main() {
  late MockIWordRepository iWordRepository;
  late WordViewModel testWordViewModel;

  setUp(() {
    iWordRepository = MockIWordRepository();
    testWordViewModel = WordViewModel(wordRepository: iWordRepository);
  });

  group(
      "Given WordViewModel test getWordOfTheDay() for both success, loading and error states",
      () {
    test("Given getWordOfTheDay() test initial state is Loading", () {
      expect(testWordViewModel.state,
          const AsyncValue<WordsOfDayListResponse>.loading());
    });
    test("Given getWordOfTheDay() test when api call is successful", () async {
      when(iWordRepository.getWordOfTheDay())
          .thenAnswer((_) => Future.value(mockWordsOfDayListResponse));
      await testWordViewModel.getWordOfTheDay();
      expect(testWordViewModel.state,
          AsyncValue<WordsOfDayListResponse>.data(mockWordsOfDayListResponse));
    });

    test("Given getWordOfTheDay() test when error occurs", () async {
      when(iWordRepository.getWordOfTheDay()).thenThrow(MockDioException);
      await testWordViewModel.getWordOfTheDay();

      expect(testWordViewModel.state.hasError, true);
    });
  });
}
