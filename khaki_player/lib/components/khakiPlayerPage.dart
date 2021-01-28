import 'package:flutter/material.dart';
import 'package:seekbar/seekbar.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:khaki_player/manager/audioManager.dart';

class KhakiPlayerPage extends StatefulWidget {

  KhakiPlayerPage() : super();

  @override
  KhakiPlayerState createState() => KhakiPlayerState();
}

class KhakiPlayerState extends State<KhakiPlayerPage> {
  AudioManager _player = AudioManager();

  KhakiPlayerState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Khaki Player')
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: Image.asset('assets/image/test_image.jpg')
                ),
                Flexible(
                    child: Text('seekbar')//SeekBar()
                ),
                Flexible(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.skip_previous),
                            onPressed: null
                        ),
                        IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: () => {_player.play('aurora arc.mp3')}
                        ),
                        IconButton(
                            icon: Icon(Icons.skip_next),
                            onPressed: null
                        )
                      ],
                    )
                )
              ]
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}