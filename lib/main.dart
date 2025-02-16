import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

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
                child: const Text(
                  "Female",
                  style: TextStyle(
                      fontFamily: "Merriweather",
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "lorem ipsum lorem ipsum lorem ipsumno, for life ohhh tell me what is up",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Raleway",
                ),
              ),
              const Spacer(),
              Center(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
