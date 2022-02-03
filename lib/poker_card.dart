import 'package:flutter/material.dart';
import 'dart:math';

class PokerCard extends StatefulWidget {
  const PokerCard({
    Key? key,
  }) : super(key: key);

  @override
  _PokerCardState createState() => _PokerCardState();
}

class _PokerCardState extends State<PokerCard> {
  static double angle = 0;
  bool isBack = true;
  _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 261,
      margin: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: _flip,
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: angle),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, double val, __) {
              if (val >= (pi / 2)) {
                isBack = false;
              } else {
                isBack = true;
              }
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(val),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: isBack
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/back.png"),
                            ),
                          ),
                        ) //if it's back we will display here
                      : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateY(pi),
                          // it will flip horizontally the container
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/face.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ));
            }),
      ),
    );
  }
}
