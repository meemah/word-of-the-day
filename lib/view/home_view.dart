import 'package:flutter/material.dart';
import 'package:wotd/repository/word_repository.dart';
import 'package:wotd/service/api_service.dart';
import 'package:wotd/util/font_family.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
              Container(
                decoration: const BoxDecoration(
                    border: (Border(
                        bottom: BorderSide(color: Colors.black, width: 5)))),
                child: Text(
                  "Female",
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
                "lorem ipsum lorem ipsum lorem ipsumno, for life ohhh tell me what is up",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.raleway.value,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () =>
                    WordRepository(apiService: ApiService()).getWordOfTheDay(),
                child: Center(
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
          ),
        ),
      ),
    );
  }
}
