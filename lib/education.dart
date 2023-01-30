import 'package:flutter/material.dart';

import 'global.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education Purpose",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:const Color(0xff203354),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/My_Images/blur bg.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
            itemCount: Global.webSite.length,
            itemBuilder: (context,i){
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('eduweb',arguments: Global.webSite[i]['url']);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(Global.webSite[i]['image'],height: 100,),
              // child: Text(text),
            ),
          );
        }),
      ),
    );
  }
}
