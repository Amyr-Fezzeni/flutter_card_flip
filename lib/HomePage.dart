import 'package:flip_card/poker_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flip Card Exemple"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(size.width * 0.1),
        child: const Center(child: PokerCard()),
      ),
    );
  }
}
