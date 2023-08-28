import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/progress_indicator_bar.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';
import 'package:mi_app_imgsound/src/widgets/exercise_grid.dart';
import 'package:mi_app_imgsound/src/widgets/draggable_button.dart';

class Game1Page extends StatefulWidget {
  @override
  _Game1PageState createState() => _Game1PageState();
}

class _Game1PageState extends State<Game1Page> {
  int coinCount = 0;
  int currentStep = 0;
  int totalSteps = 5;
  int heartCount = 3;
  List<String> exerciseGrid = List.filled(4, '');
  AudioPlayer audioPlayer = AudioPlayer();
  List<String> correctAnswers = ['Acento', 'Silencio', 'Acento', 'Silencio'];

  Future<void> playSound(String sound) async {
    final String path = 'assets/sounds/$sound.mp3';
    final int result = await audioPlayer.play(path, isLocal: true);

    if (result == 1) {
      // success
    }
  }

  void checkAnswers() {
    if (exerciseGrid == correctAnswers) {
      setState(() {
        currentStep++;
        coinCount++;
      });
    } else {
      setState(() {
        currentStep++;
        heartCount--;
      });
    }
  }

  void updateExerciseGrid(String buttonText) {
    for (int i = 0; i < exerciseGrid.length; i++) {
      if (exerciseGrid[i] == '') {
        exerciseGrid[i] = buttonText;
        break;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ritmo Pictórico'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CoinCounter(coinCount),
              ProgressIndicatorBar(currentStep, totalSteps),
              HeartsIndicator(heartCount),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿Identificas los acentos y los silencios?'),
                  SizedBox(height: 20),
                  ExerciseGrid(exerciseGrid: exerciseGrid),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DraggableButton('Acento', updateExerciseGrid),
                      DraggableButton('Silencio', updateExerciseGrid),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      playSound('conteo1');
                    },
                    child: Text('Play'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      checkAnswers();
                    },
                    child: Text('COMPROBAR'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00D8BB),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}