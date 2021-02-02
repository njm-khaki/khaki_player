import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:khaki_player/manager/audioManager.dart';

class AudioPlayerModel extends ChangeNotifier {
  AudioManager _player = AudioManager();
  int _currentPosition = 0;
  int _duration = 1;
  String _label = "";
  IconData _playButtonIcon = Icons.play_arrow;

  /// getters
  String getLabel() => this._label;
  int getCurrentPosition() => this._currentPosition;
  int getDuration() => this._duration;
  IconData getPlayButtonIcon() => this._playButtonIcon;

  /// コンストラクタ
  ///  オーディオのイベントの定義
  AudioPlayerModel():super() {
    // 曲の総再生時間が変更されたときのイベント
    this._player.onDurationChanged.listen((Duration p) {
      this._duration = p.inMilliseconds;
      // 変更の更新
      notifyListeners();
    });

    /// 再生時間が変更されたときの動作
    this._player.onAudioPositionChanged.listen((Duration p) {
        this._currentPosition = p.inMilliseconds;
        this._label = _showCurrentPositionForTime();
        // 変更を更新する
        notifyListeners();
    });

    /// 曲の再生が完了したときの動作
    this._player.onSeekComplete.listen((event) {
      this._playButtonIcon = Icons.play_arrow;
      // 変更を更新する
      notifyListeners();
    });
  }

  /// 再生/停止ボタン押下時の処理
  void onPressPlayButton() {
    switch (this._player.state) {
      case AudioPlayerState.PAUSED:
        this._player.resume();
        this._playButtonIcon = Icons.play_arrow;
        // 変更を更新する
        notifyListeners();
        break;
      case AudioPlayerState.PLAYING:
        this._player.pause();
        this._playButtonIcon = Icons.pause;
        // 変更を更新する
        notifyListeners();
        break;
      default:
        _playStart();
        this._playButtonIcon = Icons.pause;
        // 変更を更新する
        notifyListeners();
        break;
    }
  }

  /// 曲を再生する
  Future _playStart() async {
    this._player.playStart('aurora arc.mp3');
  }

  /// シークバーを移動した後の処理
  void onChangedSeekBar(double value) {
    this._player.seek(Duration(milliseconds: value.toInt()));
  }

  /// 再生時間(ミリ秒)を時間表記に変換する
  String _showCurrentPositionForTime() {
    var label = "";
    int hour = this._currentPosition ~/ Duration.millisecondsPerHour;
    label += hour != 0 ?  "$hour:" : "";

    var minute = (this._currentPosition.toInt() - hour * Duration.millisecondsPerHour) ~/ Duration.millisecondsPerMinute;
    label += minute < 10 ? "0$minute:" : "$minute:";

    var second = (this._currentPosition.toInt() - (hour * Duration.millisecondsPerHour + minute * Duration.millisecondsPerMinute)) ~/ Duration.millisecondsPerSecond;
    label += second < 10 ? "0$second" : second.toString();

    return label;
  }
}