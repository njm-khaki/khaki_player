import 'package:flutter/material.dart';
import 'package:khaki_player/components/khakiPlayerPage.dart';
import 'package:khaki_player/models/audioPlayerModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiProvider(
          providers: [
            // Providerの定義
            ChangeNotifierProvider(create: (_) => AudioPlayerModel())
          ],
          child: KhakiPlayerPage(),
        ));
  }
}
