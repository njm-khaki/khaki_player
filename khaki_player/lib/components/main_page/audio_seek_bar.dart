import 'package:audioplayers/audioplayers.dart';

import '../importer.dart';

import 'package:khaki_player/models/audio_player_model.dart';

class AudioSeekBar extends StatelessWidget {
  AudioSeekBar() : super();

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          valueIndicatorColor: Colors.cyan,
          valueIndicatorTextStyle: TextStyle(color: Colors.white)),
      child: Slider(
        label: Provider.of<AudioPlayerModel>(context).getLabel(),
        value: Provider.of<AudioPlayerModel>(context)
            .getCurrentPosition()
            .toDouble(),
        min: 0,
        max: Provider.of<AudioPlayerModel>(context).getDuration().toDouble(),
        divisions: Provider.of<AudioPlayerModel>(context).getDuration(),
        activeColor: Colors.cyan,
        inactiveColor: Colors.cyanAccent,
        onChanged: (value) {
          Provider.of<AudioPlayerModel>(context, listen: false)
              .onChangedSeekBar(value);
        },
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}