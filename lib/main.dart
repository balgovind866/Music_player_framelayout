import 'package:flutter/material.dart';
import 'package:musicplayer/player_screan.dart';
void main()
{
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        primaryColor: Color(0xff1F1F1F),
        scaffoldBackgroundColor:Color(0xff1F1F1F),
      ),
      title:'musicplayer',
      home: Screandisign(),
    );
  }
}

