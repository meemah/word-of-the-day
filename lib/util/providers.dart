import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wotd/model/words_of_day_response.dart';
import 'package:wotd/repository/word_repository.dart';
import 'package:wotd/util/service_locator.dart';
import 'package:wotd/viewmodel/word_viewmodel.dart';

final wordViewModel =
    StateNotifierProvider<WordViewModel, AsyncValue<WordsOfDayListResponse>>(
  (ref) {
    return WordViewModel(wordRepository: serviceLocator<IWordRepository>());
  },
);
