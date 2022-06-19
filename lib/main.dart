import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/index.dart';
import 'package:flutter_maps/screens/index.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => GpsBloc(),
      )
    ],
    child: const MapsApp(),
  ));
}

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
