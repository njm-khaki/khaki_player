import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class AudioManager {
  AudioPlayer _player = AudioPlayer();

  AudioManager();

  Future play(String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');

    if (!file.existsSync()) {
      final soundData = await rootBundle.load('assets/sound/$fileName');
      final bytes = soundData.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }
    await _player.play(
      file.path,
      isLocal: true,
      volume: 1.0
    );
  }
}