import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wotd/model/words_of_day_response.dart';
import 'package:wotd/util/font_family.dart';
import 'package:wotd/util/providers.dart';
import 'package:wotd/widget/wotd_shimmer.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.microtask(
          () => ref.read(wordViewModel.notifier).getWordOfTheDay());
      return null;
    }, []);
    final wordState = ref.watch(wordViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: wordState.when(
                  loading: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WotdShimmer.circular(height: 40, width: 140),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: List.generate(
                          6,
                          (index) => Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const WotdShimmer.circular(
                                  height: 20, width: double.infinity)),
                        ).toList(),
                      )
                    ],
                  ),
                  error: (error, stackTrace) => Text(error.toString()),
                  data: (data) {
                    WordOfDay wordOfDay = data.list.first;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: (Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 5)))),
                          child: Text(
                            wordOfDay.word,
                            style: TextStyle(
                                fontFamily: FontFamily.merriweather.value,
                                fontWeight: FontWeight.w700,
                                fontSize: 30),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          wordOfDay.definition,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.raleway.value,
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: GestureDetector(
                            onTap: () => Share.share(wordOfDay.definition),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Icon(
                                Icons.share,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
