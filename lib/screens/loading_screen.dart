import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_maps/blocs/index.dart';
import 'package:flutter_maps/screens/index.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (_, state) {
          return state.isAllGranted
              ? const MapScreen()
              : const GpsAccessScreen();
        },
      ),
    );
  }
}
