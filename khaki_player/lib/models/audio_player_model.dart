import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:khaki_player/manager/audio_manager.dart';

class AudioPlayerModel extends ChangeNotifier {
  AudioManager _player = AudioManager();
  int _currentPosition = 0;
  int _duration = 1;
  String _label = "";
  IconData _playButtonIcon = Icons.play_arrow;
  IconData _tmpPlayIcon = Icons.play_arrow;

  /// getters
  String getLabel() => _label;

  int getCurrentPosition() => _currentPosition;

  int getDuration() => _duration;

  IconData getPlayButtonIcon() => _playButtonIcon;
  
  void onSeeking() {
    _playButtonIcon = _tmpPlayIcon;
  }

  /// コンストラクタ
  ///  オーディオのイベントの定義
  AudioPlayerModel() : super() {
    // 曲の総再生時間が変更されたときのイベント
    _player.onDurationChanged.listen((Duration p) {
      _duration = p.inMilliseconds;
      // 変更の更新
      notifyListeners();
    });

    /// 再生時間が変更されたときの動作
    _player.onAudioPositionChanged.listen((Duration p) {
      _currentPosition = p.inMilliseconds;
      _label = _showCurrentPositionForTime();
      // 変更を更新する
      notifyListeners();
    });

    /// プレイヤーの状態が変化したときのイベント
    _player.onPlayerStateChanged.listen((event) => _changePlayButtonIcon());
  }

  /// 再生/停止ボタン押下時の処理
  /// TODO: シークをすると不整合が起きるので要修正
  void onPressPlayButton() {
    switch (_player.state) {
      case AudioPlayerState.PAUSED:
        _player.resume();
        break;
      case AudioPlayerState.PLAYING:
        _player.pause();
        break;
      default:
        _playStart();
        break;
    }
    notifyListeners();
  }

  /// 曲を再生する
  Future _playStart() async {
    _player.playStart('aurora arc.mp3');
  }

  /// シークバーを移動した後の処理
  void onChangedSeekBar(double value) => _player.seek(Duration(milliseconds: value.toInt()));

  /// 再生時間(ミリ秒)を時間表記に変換する
  String _showCurrentPositionForTime() {
    // 現在の時間で何時間か求める
    var label = "";
    int hour = _currentPosition ~/ Duration.millisecondsPerHour;
    label += hour != 0 ? "$hour:" : "";

    // 現在の時間 - 再生時間(h)で残り何分あるか求める
    var minute =
        (_currentPosition.toInt() - hour * Duration.millisecondsPerHour) ~/
            Duration.millisecondsPerMinute;
    label += minute < 10 ? "0$minute:" : "$minute:";

    // 現在の時間 - (再生時間(h) + 再生時間(m))で残り何秒あるか求める
    var second = (_currentPosition.toInt() -
            (hour * Duration.millisecondsPerHour +
                minute * Duration.millisecondsPerMinute)) ~/
        Duration.millisecondsPerSecond;
    label += second < 10 ? "0$second" : second.toString();

    return label;
  }

  /// 再生/停止ボタンの変更
  void _changePlayButtonIcon() {
    print("on player changed state: ${_player.state}");
    switch (_player.state) {
      case AudioPlayerState.STOPPED:
      case AudioPlayerState.COMPLETED:
      case AudioPlayerState.PAUSED:
        _playButtonIcon = Icons.play_arrow;
        _tmpPlayIcon = Icons.play_arrow;
        break;
      case AudioPlayerState.PLAYING:
        _playButtonIcon = Icons.pause;
        _tmpPlayIcon = Icons.pause;
        break;
      default:
        break;
    }
    // 状態の更新
    notifyListeners();
  }
}
