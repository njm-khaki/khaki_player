import 'package:flutter/material.dart';
import 'package:khaki_player/components/audioControlButton.dart';
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
                      AudioSeekBar(),
                      AudioControlButton(),
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