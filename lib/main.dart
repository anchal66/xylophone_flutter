import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final player = AudioPlayer();

  playSound(int soundNumber) async {
    var duration = await player.setAsset('assets/note$soundNumber.wav');
    player.play();
  }

  Expanded soundPallete({required int soundNumber, required Color colorArg}) {
    return Expanded(
        child: TextButton(
      style:
          TextButton.styleFrom(enableFeedback: false, padding: EdgeInsets.zero),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
