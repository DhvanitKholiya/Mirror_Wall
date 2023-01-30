import 'package:flutter/material.dart';

class OttPage extends StatefulWidget {
  const OttPage({Key? key}) : super(key: key);

  @override
  State<OttPage> createState() => _OttPageState();
}

class _OttPageState extends State<OttPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OTT Platforms",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:const Color(0xff203354),
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
