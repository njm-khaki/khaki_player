import 'importer.dart';

import 'main_page/khakiPlayerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiProvider(
          providers: [
            /// Providerの定義
            ChangeNotifierProvider(create: (_) => AudioPlayerModel())
          ],
          child: KhakiPlayerPage(),
        ));
  }
}
