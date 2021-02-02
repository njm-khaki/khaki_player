import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioControlButton extends StatelessWidget {
  final IconData _playButtonIcon;
  final Function _onPressPlayButton;

  AudioControlButton(
      this._playButtonIcon,
      this._onPressPlayButton
      ):super();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Icon(Icons.skip_previous),
            onPressed: null
        ),
        IconButton(
            icon: Icon(this._playButtonIcon),
            onPressed: () => { _onPressPlayButton() }
        ),
        IconButton(
            icon: Icon(Icons.skip_next),
            onPressed: null
        )
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}