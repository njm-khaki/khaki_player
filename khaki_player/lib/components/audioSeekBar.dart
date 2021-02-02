import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioSeekBar extends StatelessWidget {
  final String _label;
  final int _currentPosition;
  final int _duration;
  final Function(double) _onChangedSeekBar;

  AudioSeekBar(
      this._label,
      this._currentPosition,
      this._duration,
      this._onChangedSeekBar
      ):super();

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          valueIndicatorColor: Colors.cyan,
          valueIndicatorTextStyle: TextStyle(
              color: Colors.white
          )
      ),
      child: Slider(
          label: this._label,
          value: this._currentPosition.toDouble(),
          min: 0,
          max: this._duration.toDouble(),
          divisions: this._duration,
          activeColor: Colors.cyan,
          inactiveColor: Colors.cyanAccent,
          onChanged: (value) => { this._onChangedSeekBar(value) }
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}