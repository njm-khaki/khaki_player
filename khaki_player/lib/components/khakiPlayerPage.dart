import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:khaki_player/components/audioControlButton.dart';
import 'package:khaki_player/components/audioSeekBar.dart';
import 'dart:async';

import 'package:khaki_player/manager/audioManager.dart';

class KhakiPlayerPage extends StatefulWidget {

  KhakiPlayerPage() : super();

  @override
  KhakiPlayerState createState() => KhakiPlayerState();
}

class KhakiPlayerState extends State<KhakiPlayerPage> {
  AudioManager _player = AudioManager();
  int _currentPosition = 0;
  int _duration = 1;
  String _label = "";
  IconData _playButtonIcon = Icons.play_arrow;

  /**
   * コンストラクタ
   *  オーディオのイベントの定義
   */
  KhakiPlayerState() : super() {
    // 曲の総再生時間が変更されたときのイベント
    this._player.onDurationChanged.listen((Duration p) {
      setState(() {
        this._duration = p.inMilliseconds;
      });
    });

    /**
     * 再生時間が変更されたときの動作
     */
    this._player.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        this._currentPosition = p.inMilliseconds;
        this._label = _showCurrentPositionForTime();
      });
    });

    /**
     * 曲の再生が完了したときの動作
     */
    this._player.onSeekComplete.listen((event) {
      setState(() {
        this._playButtonIcon = Icons.play_arrow;
      });
    });
  }

  /**
   * 再生/停止ボタン押下時の処理
   */
  void _onPressPlayButton() {
    switch (this._player.state) {
      case AudioPlayerState.PAUSED:
        this._player.resume();
        setState(() {
          this._playButtonIcon = Icons.play_arrow;
        });
        break;
      case AudioPlayerState.PLAYING:
        this._player.pause();
        setState(() {
          this._playButtonIcon = Icons.pause;
        });
        break;
      default:
        _playStart();
        setState(() {
          this._playButtonIcon = Icons.pause;
        });
        break;
    }
  }

  /**
   * 曲を再生する
   */
  Future _playStart() async {
    this._player.playStart('aurora arc.mp3');
  }
  /**
   * シークバーを移動した後の処理
   */
  void _onChangedSeekBar(double value) {
    this._player.seek(Duration(milliseconds: value.toInt()));
  }

  /**
   * 再生時間(ミリ秒)を時間表記に変換する
   */
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      AudioSeekBar(
                          this._label,
                          this._currentPosition,
                          this._duration,
                          this._onChangedSeekBar
                      ),
                      AudioControlButton(
                          this._playButtonIcon,
                          this._onPressPlayButton
                      ),
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