  import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: PlaceWidget()
      ),
    );
  }
}

class PlaceWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlaceWidgetState();
  }
}

class PlaceWidgetState extends State<PlaceWidget> {

  PageController _controller;
  bool flag = false;
  PageController _controllerImage;

  String image1 = "https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2016/02/Lake-Palace.jpg";
  String image2 = "https://www.planetware.com/wpimages/2019/02/europe-top-places-to-visit-summer-istanbul-turkey.jpg";
  String image3 = "https://image.cnbcfm.com/api/v1/image/104339946-GettyImages-551755655.jpg?v=1534239999&w=678&h=381";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    _controllerImage = PageController(initialPage: 0);
    _controller.addListener(() {
      _controllerImage.jumpTo(_controller.position.pixels);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
         PageView(
           controller: _controllerImage,
           children: [
             imageView(image: image1),
             imageView(image: image2),
             imageView(image: image3),
           ],
         ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 100,
            height:400,
            color: Colors.red,
            child: Placeholder(),
          ),
        ),
        Container(
          child: PageView(
            controller: _controller,
            children: [
              textUi(text: "Taj Mahal"),
              textUi(text: "Flutter"),
              textUi(text: "Create a"),
            ],
          ),
          color: Colors.transparent
        )
      ],
    );
  }

  Widget textUi({String text}) {
    return Container(
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(fontSize: 50, color: Colors.white),),
    );
  }

  Widget imageView({String image}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), 
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(Colors.black45, BlendMode.softLight),
        ),
      ),
    );
  }

}
