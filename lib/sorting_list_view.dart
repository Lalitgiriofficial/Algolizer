import 'package:algolizer/sort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

// ignore: camel_case_types
class sort_list extends StatefulWidget {
  const sort_list({Key key}) : super(key: key);

  @override
  _sort_listState createState() => _sort_listState();
}

// ignore: camel_case_types
class _sort_listState extends State<sort_list> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: InkWell(
                    child: neulistcard("assets/green/bubble.png", "Bubble Sort",
                        "N^2", "N^2", "N"),
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
                    child: neulistcard("assets/green/tap.png", "Selection Sort",
                        "N^2", "N^2", "N^2"),
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
                    child: neulistcard("assets/green/insertion.png",
                        "Insertion Sort", "N^2", "N^2", "N"),
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
                    child: neulistcard("assets/green/quick.png", "Quick Sort",
                        "N^2", "N*logN", "N*logN"),
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
                    child: neulistcard("assets/green/heap.png", "Heap Sort",
                        "N*logN", "N*logN", "N*logN"),
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
                    child: neulistcard("assets/green/merge.png", "Merge Sort",
                        "N*logN", "N*logN", "N*logN"),
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
                    child: neulistcard("assets/green/shell.png", "Shell Sort",
                        "Depends on gap ", "N*log(N)^2 or N^(3/2)", "N"),
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => sort(
                                    algo_name: "Shell Sort",
                                  )));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget neulistcard(
    String _image, String text, String wc, String ac, String bc) {
  return NeuCard(
    curveType: CurveType.concave,
    decoration: NeumorphicDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(25)),
    bevel: 10,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 170,
          decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.none, image: AssetImage(_image))),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 30),
            child: Wrap(
              spacing: 3.0,
              direction: Axis.vertical,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      wordSpacing: 3,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: wc.length > 8
                      ? Text("Worst complexity : \n       $wc ")
                      : Text(
                          "Worst complexity:  $wc",
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                ),
                ac.length > 8
                    ? Text("Average complexity : \n      $ac")
                    : Text(
                        "Average complexity: $ac",
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                Text(
                  "Best complexity:  $bc",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                )
              ],
            )),
      ],
    ),
  );
}
