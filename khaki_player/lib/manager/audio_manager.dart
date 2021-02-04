import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class AudioManager extends AudioPlayer {
  AudioManager() : super();

  /**
   * ファイル名を指定して音楽を再生する
   * TODO: アセットではなくローカルファイルの再生をする
   */
  Future playStart(String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');

    if (!file.existsSync()) {
      final soundData = await rootBundle.load('assets/sound/$fileName');
      final bytes = soundData.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }
    await play(file.path, isLocal: true, volume: 1.0);
  }
}
