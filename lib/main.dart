import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: DicePage(),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Method method = new Method();
  Random random = new Random();

  int randomNumberOne = 1;
  int randomNumberTwo = 1;

  void _randomNumberGenerator() {
    setState(() {
      randomNumberOne = random.nextInt(6) + 1;
      randomNumberTwo = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Dice Game"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      _randomNumberGenerator();
                    },
                    child: Image.asset("images/dice$randomNumberOne.png"),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      _randomNumberGenerator();
                    },
                    child: Image.asset("images/dice$randomNumberTwo.png"),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            method.announcer(randomNumberOne, randomNumberTwo),
          ],
        ),
      ),
    );
  }
}

class Method {
  Widget iconTemplate() {
    return Icon(
      Icons.flag,
      color: Colors.white,
      size: 30,
    );
  }

  Widget announcer(randomNumberOne, randomNumberTwo) {
    // requires to have a non empty widget or else it will cause an error because of null safety
    Widget child = Text("");
    if (randomNumberOne > randomNumberTwo) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconTemplate(),
          Text(
            "Player One Wins",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      );
    } else if (randomNumberOne < randomNumberTwo) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Player Two Wins",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          iconTemplate(),
        ],
      );
    } else {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconTemplate(),
          Text(
            "Draw",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          iconTemplate()
        ],
      );
    }
    return new Container(child: child);
  }
}
