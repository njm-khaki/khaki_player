import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
          title: Text('Khaki Player')
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('hoge'),
                Text('foo'),
                Text('bar'),
              ]
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}