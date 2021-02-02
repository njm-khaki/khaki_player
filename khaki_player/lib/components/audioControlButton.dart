import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khaki_player/models/adioPlayerModel.dart';
import 'package:provider/provider.dart';

class AudioControlButton extends StatelessWidget {

  AudioControlButton():super();

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
            icon: Icon(Provider.of<AudioPlayerModel>(context).getPlayButtonIcon()),
            onPressed: () => { Provider.of<AudioPlayerModel>(context, listen: false).onPressPlayButton() }
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