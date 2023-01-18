import 'package:flutter/material.dart';
import 'package:mirror_wall/Sony.dart';
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
      appBar: AppBar(
        title: const Text(
          "Mirror Wall",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:Color(0xff203354),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/My_Images/background.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: GridView(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            OTTRow('assets/My_Images/hotstar logo.png','star',),
            OTTRow('assets/My_Images/Netflix-Logo.png','netflix',),
            OTTRow('assets/My_Images/prime logo.png','prime',),
            OTTRow('assets/My_Images/sony_logo-removebg-preview.png','sony',),
            OTTRow('assets/My_Images/youtube_logo-removebg-preview.png','you_tube',),
          ],
        ),
      ),
    );
  }
  GestureDetector OTTRow(String image,String pageKey,) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(pageKey);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Image.asset(image,height: 100,),
        // child: Text(text),
      ),
    );
  }

}
