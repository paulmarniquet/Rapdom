import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class PlayPage extends MaterialPageRoute<void> {
  PlayPage()
      : super(builder: (BuildContext context) {
          MainAxisAlignment.start;
          return Scaffold(
            body: Center(
                child: Column(children: <Widget>[
              const SizedBox(height: 200),
              TimerWidget(),
            ])),
            backgroundColor: const Color.fromARGB(255, 248, 240, 203),
          );
        });
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  String textFromFile = "Let's go!";
  int timeleft = 5;
  int timeOnPage = 0;
  List<String> array = [];

  getData() async {
    String response;
    response = await rootBundle.loadString('assets/dictionary.txt');
    LineSplitter.split(response).forEach((line) => (array.add(line)));
    setState(() {
      textFromFile = array[Random().nextInt(array.length)];
    });
  }

  void startcountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeleft != 0) {
        setState(() {
          timeleft--;
        });
      } else {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

  void timeOnPageFunc() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeOnPage++;
      if (timeOnPage == 1) {
        getData();
        startcountdown();
      }
      if (timeleft == 0) {
        setState(() {
          resetcountdown();
          getData();
        });
      }
    });
  }

  void resetcountdown() {
    setState(() {
      timeleft = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeOnPageFunc();
    return Column(children: [
      const SizedBox(height: 50),
      Text(textFromFile,
          style: const TextStyle(
              fontSize: 50, fontFamily: 'SemiThin', color: Colors.black)),
      const SizedBox(height: 50),
      Text(
        timeleft.toString(),
        style: const TextStyle(
            fontSize: 70, fontFamily: 'SemiThin', color: Colors.black87),
      ),
    ]);
  }
}
