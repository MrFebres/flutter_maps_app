import 'package:flutter/material.dart';

import 'package:flutter_maps/screens/index.dart';

void main() => runApp(const MapsApp());

class MapsApp extends StatelessWidget {
  const MapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GpsAccessScreen(),
      title: 'Maps App',
    );
  }
}
