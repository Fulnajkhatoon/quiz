import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/home_screen.dart';
import 'package:quiz/image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    //home top page colors
                    colors: [
                      const Color.fromARGB(201, 158, 158, 158),
                      const Color.fromARGB(255, 240, 219, 218),
                    ]),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(70)),
              ),
              child: Center(
                  //home page book image
                  child: Image.asset(
                book,
                scale: 0.8,
              )),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.666,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //botom top page colors
                  colors: [
                    const Color.fromARGB(201, 158, 158, 158),
                    const Color.fromARGB(255, 240, 219, 218),
                  ]),
              // borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.666,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                //white curve in bottom
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
            child: Column(
              children: [
                const Text("Learn And Give Quiz",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        wordSpacing: 2)),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Learning with pleassure with dear proggramer , wherever you are!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: Colors.black87),
                  ),
                ),
                //symmetric means equally pading from both top and bottom side
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        //botom top page colors
                        colors: [Colors.purple, Colors.indigo]),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 20, color: Colors.white, letterSpacing: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
