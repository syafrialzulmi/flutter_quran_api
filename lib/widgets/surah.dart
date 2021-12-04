import 'package:flutter/material.dart';
import '../widgets/surah_item.dart';

class Surah extends StatelessWidget {
  const Surah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      SurahItem(),
    ]);
  }
}
