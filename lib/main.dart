// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, use_super_parameters, unrelated_type_equality_checks

import 'package:flutter/material.dart';

import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Timerapp(),
    );
  }
}

class Timerapp extends StatefulWidget {
  const Timerapp({super.key});

  @override
  State<Timerapp> createState() => _TimerappState();
}

class _TimerappState extends State<Timerapp> {
  Timer? timerfunc;
  Duration duration = Duration(seconds: 0);
  timercahange() {
    timerfunc = Timer.periodic(Duration(milliseconds: 1), (r) {
      setState(() {
        int aseconuds = duration.inSeconds + 1;
        duration = Duration(seconds: aseconuds);
      });
    });
  }

  bool running = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 93, 233),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 17, 31, 82),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      duration.inHours.toString().padLeft(2, '0'),
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 17, 31, 82),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      duration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 17, 31, 82),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      duration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Hours',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Minutes',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'seconds',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 13,
                ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            running
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (timerfunc!.isActive) {
                            setState(() {
                              timerfunc!.cancel();
                            });
                          } else {
                            timercahange();
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                Color.fromARGB(255, 243, 33, 33))),
                        child: Text(
                          timerfunc!.isActive ? "STOP TIMER" : "RESUME",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 246, 245, 245),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          timerfunc!.cancel();
                          setState(() {
                            duration = Duration(seconds: 0);
                            running = false;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.blue)),
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 251, 250, 253),
                          ),
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Color.fromARGB(255, 16, 199, 74))),
                    onPressed: () {
                      timercahange();
                      setState(() {
                        running = true;
                      });
                    },
                    child: Text(
                      "Start Timer",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ))
          ],
        ),
      ),
    );
  }
}
