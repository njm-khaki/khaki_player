import 'package:flutter/material.dart';
import 'dart:async';

import 'package:khaki_player/manager/audioManager.dart';

class KhakiPlayerPage extends StatefulWidget {

  KhakiPlayerPage() : super();

  @override
  KhakiPlayerState createState() => KhakiPlayerState();
}

class KhakiPlayerState extends State<KhakiPlayerPage> {
  AudioManager _player = AudioManager();
  int _seekValue = 0;
  int _seekMaxValue = 1;
  Timer _timer;

  KhakiPlayerState() : super() {
    this._player.onDurationChanged.listen((Duration p){
      setState(() {
        this._seekMaxValue = p.inMilliseconds;
      });
    });

    this._player.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        this._seekValue = p.inMilliseconds;
      });
    });
  }

  Future _playStart() async {
    this._player.playStart('aurora arc.mp3');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Text('Khaki Player')
      ),
      body: Container(
        width: size.width * 0.9,
        margin: EdgeInsets.fromLTRB(size.width * 0.05, 0, size.width * 0.05, 0),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/image/test_image.jpg'),
                      Slider(
                          value: this._seekValue.toDouble(),
                          min: 0,
                          max: this._seekMaxValue.toDouble(),
                          activeColor: Colors.cyan,
                          inactiveColor: Colors.cyanAccent,
                          onChanged: null
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(Icons.skip_previous),
                              onPressed: null
                          ),
                          IconButton(
                              icon: Icon(Icons.play_arrow),
                              onPressed: () => {_playStart()}
                          ),
                          IconButton(
                              icon: Icon(Icons.skip_next),
                              onPressed: null
                          )
                        ],
                      ),
                    ],
                  )
              )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}