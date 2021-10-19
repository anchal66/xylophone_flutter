import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  playSound(int soundNumber) async {
    final player = AudioPlayer();
    var duration = await player.setAsset('assets/note$soundNumber.wav');
    player.play();
  }

  Expanded soundPallete({required int soundNumber, required Color colorArg}) {
    return Expanded(
        child: TextButton(
      style: ButtonStyle(enableFeedback: false),
      onPressed: () => playSound(soundNumber),
      child: Container(
        color: colorArg,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              soundPallete(soundNumber: 1, colorArg: Colors.purple),
              soundPallete(soundNumber: 2, colorArg: Colors.indigo),
              soundPallete(soundNumber: 3, colorArg: Colors.blue),
              soundPallete(soundNumber: 4, colorArg: Colors.green),
              soundPallete(soundNumber: 5, colorArg: Colors.yellow),
              soundPallete(soundNumber: 6, colorArg: Colors.red)
            ],
          ),
        ),
      ),
    );
  }
}
