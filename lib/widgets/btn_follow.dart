import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_maps/blocs/blocs.dart';

class BtnFollow extends StatelessWidget {
  const BtnFollow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 0,
        heroTag: 'BtnFollow',
        onPressed: () => mapBloc.add(StartFollowingUserInMap()),
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Icon(
              state.isFollowingUser
                  ? Icons.directions_run_rounded
                  : Icons.hail_rounded,
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}
