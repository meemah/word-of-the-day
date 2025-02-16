import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wotd/model/words_of_day_response.dart';
import 'package:wotd/repository/word_repository.dart';

class WordViewModel extends StateNotifier<AsyncValue<WordsOfDayListResponse>> {
  final IWordRepository wordRepository;

  WordViewModel({required this.wordRepository})
      : super(const AsyncValue.loading());

  Future<void> getWordOfTheDay() async {
    state = const AsyncValue.loading();
    try {
      final word = await wordRepository.getWordOfTheDay();
      state = AsyncValue.data(word);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
