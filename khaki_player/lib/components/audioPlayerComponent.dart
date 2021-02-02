
import 'package:flutter/cupertino.dart';

import 'audioControlButton.dart';
import 'audioSeekBar.dart';

class AudioPlayerComponent extends StatelessWidget {
  final double _widthRate = 0.9;
  double _paddingSide;

  AudioPlayerComponent():super() {
    _paddingSide = (1 - _widthRate) / 2;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * _widthRate,
      margin: EdgeInsets.fromLTRB(size.width * this._paddingSide, 0, size.width * this._paddingSide, 0),
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
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}