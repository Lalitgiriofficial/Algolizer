import 'package:algolizer/sort.dart';
import 'package:algolizer/sorting_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neumorphic/neumorphic.dart';

// ignore: camel_case_types
class main_screen extends StatefulWidget {
  @override
  _main_screenState createState() => _main_screenState();
}

// ignore: camel_case_types
class _main_screenState extends State<main_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    'Algolizer',
                    style: TextStyle(
                      fontSize: 27,
                      color: Color(0xff32506b),
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          color: Colors.white54,
                          offset: Offset(-2, 2),
                          blurRadius: 3,
                        )
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sorting Algorithms",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Century Gothic',
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(context,CupertinoPageRoute(builder: (context)=>sort_list()));
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(50),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child:
                              neucard("assets/green/bubble.png", "Bubble Sort"),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => sort(
                                          algo_name: "Bubble Sort",
                                        )));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child:
                              neucard("assets/green/tap.png", "Selection Sort"),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => sort(
                                          algo_name: "Selection Sort",
                                        )));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: neucard(
                              "assets/green/insertion.png", "Insertion Sort"),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => sort(
                                          algo_name: "Insertion Sort",
                                        )));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: neucard("assets/green/quick.png", "Quick Sort"),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => sort(
                                          algo_name: "Quick Sort",
                                        )));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: neucard("assets/green/heap.png", "Heap Sort"),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => sort(
                                          algo_name: "Heap Sort",
                                        )));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: neucard("assets/green/merge.png", "Merge Sort"),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => sort(
                                          algo_name: "Merge Sort",
                                        )));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: neucard("assets/green/shell.png", "Shell Sort"),
                          onTap: () {
                            Navigator.push(
                                context,
                               CupertinoPageRoute(builder: (context)=>sort(algo_name: "Shell Sort",)));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Path Finding Algorithms",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Century Gothic',
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: Text(
                  "Coming soon",
                  style: TextStyle(color: Colors.black54),
                ),
              )
            ],
          )),
    );
  }
}

Widget neucard(String _image, String text) {
  return NeuCard(
    curveType: CurveType.concave,
    decoration: NeumorphicDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(25)),
    bevel: 10,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 120,
          height: 170,
          decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.none, image: AssetImage(_image))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        )
      ],
    ),
  );
}
