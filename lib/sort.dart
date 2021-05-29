import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:neumorphic/neumorphic.dart';

// ignore: camel_case_types
class sort extends StatefulWidget {
  String algo_name;

  sort({this.algo_name});

  @override
  sortState createState() => sortState();
}

// ignore: camel_case_types
class sortState extends State<sort> {
  List<int> _numbers = [];
  int _samplesize=250 ;
  StreamController<List<int>> streamcontroller;
  Stream _stream;
  bool issorting = false;
  bool iscompleted = true;
  IconData icon = Icons.play_arrow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamcontroller = StreamController();
    _stream = streamcontroller.stream;

    _randomize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamcontroller.close();
  }

  void _reset() {

    _numbers = [];
    _randomize();
  }

  _checkAndResetIfSorted() async {
    if (iscompleted) {
      _reset();
      await Future.delayed(Duration(milliseconds: 200));
    }else{
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.algo_name,
                style: TextStyle(
                  fontFamily: 'Century Gothic',
                  fontSize: 25,
                  color: Color(0xFFDEEDCF),
                  wordSpacing: 2,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            backgroundColor: Color(0xFF188977),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: StreamBuilder<Object>(
                  stream: _stream,
                  builder: (context, snapshot) {
                    int counter = 0;
                    return Row(
                      children: _numbers.map((int number) {
                        counter++;
                        return CustomPaint(
                          painter: BarPainter(
                              width:
                                  MediaQuery.of(context).size.width / _samplesize,
                              value: number,
                              index: counter),
                        );
                      }).toList(),
                    );
                  }),
            ),
           issorting?Slider(
             value: _samplesize.toDouble(),
             min: 50,
             max: 300,
             activeColor: Color(0xFF188977),
             inactiveColor: Colors.grey,
             onChanged: null
           ): Slider(
             value: _samplesize.toDouble(),
             min: 50,
             max: 300,
             activeColor: Color(0xFF188977),
             inactiveColor: Colors.grey,
             onChanged: (val){
               setState(() {
                 _reset();
                 _samplesize=val.toInt();

               });
             },
           ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 13.0),
          child: Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: NeuButton(
                        onPressed: (){
                          if(issorting==true){
                            return null;
                          }
                          else{
                            _reset();
                          }
                        },
                        decoration: NeumorphicDecoration(
                      color: Colors.grey.shade100,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)
                    ),
                        child: Text("Reset",
                            style: TextStyle(color: Colors.black,fontSize: 20),)),

                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: NeuButton(
                        onPressed: iscompleted?sorting:(){},
                        decoration: NeumorphicDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("Sort",
                          style: TextStyle(color: Colors.black,fontSize: 20),)),

                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void bubble_sort() async {
    for (int i = 0; i < _samplesize; i++) {
      for (int j = 0; j < _samplesize - 1; j++) {
        if (_numbers[j] > _numbers[j + 1]) {
          int temp = _numbers[j];
          _numbers[j] = _numbers[j + 1];
          _numbers[j + 1] = temp;
        }
        await Future.delayed(Duration(microseconds: 0));
        streamcontroller.add(_numbers);
      }
    }
  }

  // ignore: non_constant_identifier_names
  void insertion_sort() async {
    int j, key;
    for (int i = 1; i < _samplesize; i++) {
      j = i - 1;
      key = _numbers[i];
      while (j > 0 && _numbers[j] > key) {
        _numbers[j + 1] = _numbers[j];
        j = j - 1;
      }
      _numbers[j + 1] = key;
      await Future.delayed(Duration(microseconds: 1000));
      streamcontroller.add(_numbers);
    }
  }

  // ignore: non_constant_identifier_names
  void selection_sort() async {
    int i, j, min = 0, temp;
    for (i = 0; i < _samplesize - 1; i++) {
      min = i;
      for (j = i + 1; j < _samplesize; j++) {
        if (_numbers[j] < _numbers[min]) min = j;
      }
      temp = _numbers[i];
      _numbers[i] = _numbers[min];
      _numbers[min] = temp;
      await Future.delayed(Duration(milliseconds: 10));
      streamcontroller.add(_numbers);
    }
  }

  Future<int> partition(List<int> a, int lb, int ub) async {
    int pivot, start, end, temp;
    pivot = a[lb];
    start = lb;
    end = ub;
    while (start < end) {
      while (a[start] <= pivot && start < ub) {
        start++;
        await Future.delayed(Duration(microseconds: 800));
        streamcontroller.add(_numbers);
      }
      while (a[end] > pivot) {
        end--;
        await Future.delayed(Duration(microseconds: 800));
        streamcontroller.add(_numbers);
      }
      if (start < end) {
        temp = a[start];
        a[start] = a[end];
        a[end] = temp;
        await Future.delayed(Duration(microseconds: 1000));
        streamcontroller.add(_numbers);
      }
    }

    temp = a[end];
    a[end] = a[lb];
    a[lb] = temp;
    await Future.delayed(Duration(microseconds: 500));
    streamcontroller.add(_numbers);
    return end;
  }

  // ignore: non_constant_identifier_names
  quick_sort(List<int> a, int lb, int ub) async {
    int loc = 0;

    if (lb < ub) {
      loc = await partition(a, lb, ub);

      await quick_sort(a, lb, loc - 1);
      await quick_sort(a, loc + 1, ub);
    }
  }

  // ignore: non_constant_identifier_names
  heap_sort() async {
    for (int i = _numbers.length ~/ 2; i >= 0; i--) {
      await heapify(_numbers, _numbers.length, i);
      streamcontroller.add(_numbers);
    }
    for (int i = _numbers.length - 1; i >= 0; i--) {
      int temp = _numbers[0];
      _numbers[0] = _numbers[i];
      _numbers[i] = temp;
      await heapify(_numbers, i, 0);
      streamcontroller.add(_numbers);
    }
  }

  heapify(List<int> a, int n, int i) async {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    if (l < n && a[l] > a[largest]) largest = l;
    if (r < n && a[r] > a[largest]) largest = r;
    if (largest != i) {
      int temp = _numbers[i];
      _numbers[i] = _numbers[largest];
      _numbers[largest] = temp;
      heapify(a, n, largest);
    }
    await Future.delayed(Duration(microseconds: 10000));
  }

  Future<void> mergesort(List<int> a, int start, int last) async {
    int mid;
    if (start < last) {
      mid = (start + last) ~/ 2;
      await mergesort(a, start, mid);
      await mergesort(a, mid + 1, last);
      await Future.delayed(Duration(microseconds: 1000));
      streamcontroller.add(_numbers);
      await merge(a, start, last, mid);
    }
  }

  Future<void> merge(List<int> arr, int l, int r, int m) async {
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    var L = new List(n1);
    var R = new List(n2);
    for (i = 0; i < n1; i++) L[i] = arr[l + i];
    for (j = 0; j < n2; j++) R[j] = arr[m + 1 + j];

    /* Merge the temp arrays back into arr[l..r]*/
    i = 0; // Initial index of first subarray
    j = 0; // Initial index of second subarray
    k = l; // Initial index of merged subarray
    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        arr[k] = L[i];
        i++;
      } else {
        arr[k] = R[j];
        j++;
      }
      k++;
      await Future.delayed(Duration(microseconds: 1000));
      streamcontroller.add(_numbers);
    }

    /* Copy the remaining elements of L[], if there
    are any */
    while (i < n1) {
      arr[k] = L[i];
      i++;
      k++;
      await Future.delayed(Duration(microseconds: 1000));
      streamcontroller.add(_numbers);
    }

    /* Copy the remaining elements of R[], if there
    are any */
    while (j < n2) {
      arr[k] = R[j];
      j++;
      k++;
      await Future.delayed(Duration(microseconds: 1000));
      streamcontroller.add(_numbers);
    }
  }

  // ignore: non_constant_identifier_names
  void shell_sort(List<int> arr, int n) async {
    for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
      for (int i = gap; i < n; i += 1) {
        int temp = arr[i];
        int j;
        for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
          arr[j] = arr[j - gap];
          await Future.delayed(Duration(microseconds: 400));
          streamcontroller.add(_numbers);
        }
        arr[j] = temp;
        await Future.delayed(Duration(microseconds: 1700));
        streamcontroller.add(_numbers);
      }
    }
  }

  void _randomize() {
    _numbers = [];

    for (int i = 0; i < _samplesize; i++) {
      _numbers.add(Random().nextInt(500));
    }
    streamcontroller.add(_numbers);
  }

  // ignore: non_constant_identifier_names

  sorting() async {
    setState(() {
      issorting = true;
      iscompleted = false;
    });

    await _checkAndResetIfSorted();
    if (widget.algo_name == "Bubble Sort") {
      bubble_sort();
    } else if (widget.algo_name == "Selection Sort") {
      selection_sort();
    } else if (widget.algo_name == "Insertion Sort") {
      insertion_sort();
    } else if (widget.algo_name == "Quick Sort") {
      quick_sort(_numbers, 0, _samplesize - 1);
    } else if (widget.algo_name == "Heap Sort") {
      heap_sort();
    } else if (widget.algo_name == "Merge Sort") {
      mergesort(_numbers, 0, _samplesize - 1);
    } else if (widget.algo_name == "Shell Sort") {
      shell_sort(_numbers, _numbers.length);
    }
    setState(() {
      issorting = false;
      iscompleted = true;
    });
  }
}

class BarPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  BarPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    if (this.value < 500 * 0.10) {
      paint.color = Color(0xFFDEEDCF);
    } else if (this.value < 500 * 0.20) {
      paint.color = Color(0xFFBFE180);
    } else if (this.value < 500 * 0.30) {
      paint.color = Color(0xFF99D492);
    } else if (this.value < 500 * 0.40) {
      paint.color = Color(0xFF74C67A);
    } else if (this.value < 500 * 0.500) {
      paint.color = Color(0xFF56B870);
    } else if (this.value < 500 * 0.60) {
      paint.color = Color(0xFF39A96B);
    } else if (this.value < 500 * 0.70) {
      paint.color = Color(0xFF1D9A6C);
    } else if (this.value < 500 * 0.80) {
      paint.color = Color(0xFF188977);
    } else if (this.value < 500 * .90) {
      paint.color = Color(0xFF137177);
    } else
      paint.color = Color(0xFF0E4D64);
    // paint.color=Colors.indigo;
    paint.strokeWidth = width + 1;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset((index * this.width), 0),
        Offset(index * this.width, this.value.ceilToDouble()), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
