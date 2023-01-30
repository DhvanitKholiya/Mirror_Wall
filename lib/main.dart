import 'package:flutter/material.dart';
import 'package:mirror_wall/Sony.dart';
import 'package:mirror_wall/education.dart';
import 'package:mirror_wall/education_website.dart';
import 'package:mirror_wall/ottPage.dart';
import 'package:mirror_wall/you_tube.dart';
import 'Hostar.dart';
import 'Netflix.dart';
import 'Amazone.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'star' : (context) => const HotStar(),
      'netflix' : (context) => const Netflix(),
      'prime' : (context) => const AmazonPrime(),
      'sony' : (context) => const Sony(),
      'you_tube' : (context) => const YouTube(),
      'ott' : (context) => const OttPage(),
      'edu' : (context) => const EducationPage(),
      'eduweb' : (context) => const EduWebsite(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('ott');}, child: const Text("OTT Platforms")),
            ElevatedButton(onPressed: (){Navigator.of(context).pushNamed('edu');}, child: const Text("Education Platforms")),
          ],
        ),
      ),
    );
  }
}
