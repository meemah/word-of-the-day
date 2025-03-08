import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:wotd/generated/l10n.dart';
import 'package:wotd/repository/word_repository.dart';
import 'package:wotd/util/providers.dart';
import 'package:wotd/view/home_view.dart';
import 'package:wotd/viewmodel/word_viewmodel.dart';

import '../test_helpers.dart';
import '../test_helpers.mocks.dart';

void main() {
  late IWordRepository wordRepository;
  late Widget testScreen;
  setUp(() {
    wordRepository = MockIWordRepository();
    testScreen = ProviderScope(
      overrides: [
        wordViewModel.overrideWith(
            (ref) => WordViewModel(wordRepository: wordRepository)),
      ],
      child: MaterialApp(
        home: const HomeView(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  });

  testWidgets('Test the completed state of the home view, but list is empty',
      (tester) async {
    when(
      wordRepository.getWordOfTheDay(),
    ).thenAnswer((_) async => Future.value(mockEmptyWordsOfDayListResponse));
    await tester.pumpWidget(testScreen);
    await tester.pump();
    expect(find.byKey(const ValueKey("wotd_empty_key")), findsOne);
  });
  testWidgets("Test the completed state of the home view, when there is data",
      (tester) async {
    when(wordRepository.getWordOfTheDay())
        .thenAnswer((_) async => Future.value(mockWordsOfDayListResponse));
    await tester.pumpWidget(testScreen);
    await tester.pump();
    expect(find.byKey(const ValueKey("wotd_completed_key")), findsOne);
  });

  testWidgets("Test the error state of the Home View", (tester) async {
    when(wordRepository.getWordOfTheDay())
        .thenAnswer((_) async => Future.error(""));
    await tester.pumpWidget(testScreen);
    await tester.pump();
    expect(find.byKey(const ValueKey("wotd_error_key")), findsOne);
  });
}
