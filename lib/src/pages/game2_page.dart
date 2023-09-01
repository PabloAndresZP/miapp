import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mi_app_imgsound/src/widgets/coin_counter.dart';
import 'package:mi_app_imgsound/src/widgets/hearts_indicator.dart';

class Game2Page extends StatefulWidget {
  @override
  _Game2PageState createState() => _Game2PageState();
}

class _Game2PageState extends State<Game2Page> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  int selectedAnswer = -1;
  int completedExercises = 0;
  int coins = 0;
  int hearts = 3;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause(String audioUrl) {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(audioUrl);
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _checkAnswer() {
    bool isCorrect = selectedAnswer == 1;
    if (isCorrect) {
      completedExercises++;
      if (completedExercises == 3) {
        coins++;
        completedExercises = 0;
      }
    } else {
      hearts--;
      if (hearts == 0) {
        // TODO: Termina el juego y navega a la pantalla de niveles.
      }
    }
    // TODO: Actualizar la UI y pasar a la siguiente pregunta o lección.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game 2'),
        actions: [
          CoinCounter(coins),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // TODO: Aquí iría el ProgressBar.
                HeartsIndicator(hearts),
              ],
            ),
            Text(
              '¿Con qué escala asocias esta imagen?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            Image.asset('assets/images/bosquet.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _playPause('assets/audios/escmayor.mp3'),
                  child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                ),
                ElevatedButton(
                  onPressed: () => _playPause('assets/audios/escmenor.mp3'),
                  child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswer = value as int;
                    });
                  },
                ),
                Text('escmayor.mp3'),
                Radio(
                  value: 1,
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswer = value as int;
                    });
                  },
                ),
                Text('escmenor.mp3'),
              ],
            ),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: Text('Comprobar'),
            ),
          ],
        ),
      ),
    );
  }
}