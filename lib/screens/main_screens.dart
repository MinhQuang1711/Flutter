import 'dart:async';
import 'dart:math';
import 'package:chew_jump/Model/barrie_bottom.dart';
import 'package:chew_jump/colum_provider.dart';
import 'package:provider/provider.dart';
import 'package:chew_jump/Model/chewModel.dart';
import 'package:flutter/material.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  double chewYaxis = 0;
  double time = 0;
  double heightbird = 0;
  double initiHeight = 0;
  bool gameHasStarted = false;
  int score = 0;
  int bestScore = 0;
  double columX = 1.5;
  double columX2 = 3;
  double heightBarrie1 = 190;
  double heightBarrie2 = 190;

  void RandomHeightColum1() {
    int intValue1 = Random().nextInt(35) + 170;

    heightBarrie1 = double.parse(intValue1.toString());
  }

  void RandomHeightColum2() {
    int intValue2 = Random().nextInt(40) + 150;
    heightBarrie2 = double.parse(intValue2.toString());
  }

  void changeScore() {
    setState(() {
      score += 1;
    });
  }

  void changeBestScore() {
    if (score > bestScore) {
      setState(() {
        bestScore = score;
      });
    }
  }

  void reStartGame() {
    Navigator.pop(context);

    setState(() {
      gameHasStarted = false;
      time = 0;
      chewYaxis = 0;
      columX = 1.5;
      columX2 = 3;
      initiHeight = chewYaxis;
      score = 0;
    });
  }

  void showDiaLogEndGame() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 40,
                    child: Image.asset(
                      'lib/assets/alert.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Còn non lắm=))',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      child: Icon(
                        Icons.restart_alt_outlined,
                        color: Colors.green,
                      ),
                      onTap: reStartGame,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void jump() {
    setState(() {
      time = 0;
      initiHeight = chewYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 15), (timer) {
      heightbird = -4 * time * time + 2.5 * time;
      setState(() {
        chewYaxis = initiHeight - heightbird;
        columX -= 0.015;
        columX2 -= 0.015;
      });
      if (chewYaxis < -1 || chewYaxis > 1) {
        timer.cancel();
        print('dead');
        gameHasStarted = false;
        showDiaLogEndGame();
      }

      if (columX < -1.5) {
        setState(() {
          RandomHeightColum1();
          columX = 1.5;
        });
      }

      if (columX2 < -1.5) {
        setState(() {
          RandomHeightColum2();
          columX2 = 1.5;
        });
      }
      if (columX >= -0.45 && columX < -0.3) {
        if (chewYaxis < 0) {
          double chewheight = 292.5 + (-1 * chewYaxis * 10) * 58.5;
          var x = 585 - 2 * heightBarrie1 + 0.9 * heightBarrie1;
          if (chewheight >= 585 - 2 * heightBarrie1 + heightBarrie1) {
            print('chew height ${chewheight}');
            print(x);
            timer.cancel();
            gameHasStarted = false;
            showDiaLogEndGame();
          } else {
            changeScore();
            changeBestScore();
          }
        }
        if (chewYaxis > 0) {
          double chewheight = 292.5 - chewYaxis * 10 * 58.5;
          if (chewheight < heightBarrie1) {
            timer.cancel();
            gameHasStarted = false;
            showDiaLogEndGame();
          } else {
            changeScore();
            changeBestScore();
          }
        }
      }
      if (columX2 >= -0.45 && columX2 < -0.3) {
        if (chewYaxis < 0) {
          double chewheight = 292.5 + (-1 * chewYaxis * 10) * 58.5;
          var x = 585 - 2 * heightBarrie2 + 0.9 * heightBarrie2;
          if (chewheight > 585 - 2 * heightBarrie2 + heightBarrie2) {
            timer.cancel();
            gameHasStarted = false;
            showDiaLogEndGame();
          } else {
            changeScore();
            changeBestScore();
          }
        }
        if (chewYaxis > 0) {
          double chewheight = 292.5 - chewYaxis * 10 * 58.5;
          if (chewheight < heightBarrie2) {
            timer.cancel();
            gameHasStarted = false;
            showDiaLogEndGame();
          }
          {
            changeScore();
            changeBestScore();
          }
        }
      }
      time = time + 0.01;
    });
  }

  double sizeEx = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/may.png'), fit: BoxFit.cover)),
          // color: Colors.blue,
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Stack(children: [
                    Barrie(
                      text: 'Colum2',
                      columX: columX2,
                      columY: -1,
                      height: heightBarrie2,
                    ),
                    Barrie(
                      text: "Colum2",
                      columX: columX2,
                      columY: 1,
                      height: heightBarrie2,
                    ),
                    Barrie(
                      text: 'Colum1',
                      columX: columX,
                      columY: 1,
                      height: heightBarrie1,
                    ),
                    Container(
                      alignment: Alignment(0, -0.5),
                      child: Text(
                        gameHasStarted ? " " : "T A P T O P L A Y",
                        style: TextStyle(
                            color: Colors.brown.shade800,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    AnimatedContainer(
                        duration: Duration(milliseconds: 1),
                        alignment: Alignment(-0.4, chewYaxis),
                        child: ChewBird()),
                    Barrie(
                      text: "colum1",
                      columX: columX,
                      columY: -1,
                      height: heightBarrie1,
                    ),
                  ])),
              Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.pink])),
                height: 13,
              ),
              Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.deepOrange, Colors.green])),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'SCORE: ${score / 20}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              )),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 100),
                            child: Text(
                              'BEST SCORE: ${bestScore / 20} ',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          )
                          //Container(),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
