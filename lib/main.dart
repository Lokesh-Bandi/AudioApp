import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  @override
  final audioPlayer = AudioCache();
  AudioPlayer ala =AudioPlayer() ;
  void playSound(int soundNumber){
    audioPlayer.play('note$soundNumber.wav');
  }
  void _playFile() async{
    ala = await audioPlayer.play('Samajavaragamana-Violin-BGM-Ringtone.mp3'); // assign player here
  }
  void _pauseFile() {
    ala?.pause(); // stop the file like this
  }
  void _resumeFile() {
    ala?.resume(); // stop the file like this
  }
  Expanded buildSound(int number,Color colorname){
    return Expanded(
      child: FlatButton(
        onPressed: (){
          playSound(number);
        },
        color: colorname,
      ),
    );
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildSound(1, Colors.red),
              buildSound(2, Colors.yellow),
              buildSound(3, Colors.blue),
              buildSound(4, Colors.orange),
              buildSound(5, Colors.green),
              buildSound(6, Colors.pink),
              buildSound(7, Colors.purple),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    _playFile();
                  },
                  color: Colors.brown,
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: (){
                          _pauseFile();
                        },
                        child: Icon(
                            Icons.pause_circle_filled
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          _resumeFile();
                        },
                        child: Icon(
                            Icons.play_circle_filled
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );;
  }
}


