import 'package:flutter/material.dart';
import 'package:khaki_player/components/audioControlButton.dart';
import 'package:khaki_player/components/audioPlayerComponent.dart';
import 'package:khaki_player/components/audioSeekBar.dart';

class KhakiPlayerPage extends StatefulWidget {

  KhakiPlayerPage() : super();

  @override
  KhakiPlayerState createState() => KhakiPlayerState();
}

class KhakiPlayerState extends State<KhakiPlayerPage> {

  KhakiPlayerState():super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Khaki Player')
      ),
      body: AudioPlayerComponent(),
    );
    throw UnimplementedError();
  }
}