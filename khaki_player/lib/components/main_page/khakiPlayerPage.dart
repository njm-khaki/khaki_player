import '../importer.dart';

import 'audio_player_component.dart';

class KhakiPlayerPage extends StatefulWidget {
  KhakiPlayerPage() : super();

  @override
  KhakiPlayerState createState() => KhakiPlayerState();
}

class KhakiPlayerState extends State<KhakiPlayerPage> {
  KhakiPlayerState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Khaki Player')),
      body: AudioPlayerComponent(),
    );
    throw UnimplementedError();
  }
}
