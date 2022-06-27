import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_maps/blocs/blocs.dart';

class BtnToggleRoute extends StatelessWidget {
  const BtnToggleRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 0,
        heroTag: 'BtnToggleRoute',
        onPressed: () => mapBloc.add(ToggleShowRoute()),
        child: const Icon(
          Icons.more_horiz_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
