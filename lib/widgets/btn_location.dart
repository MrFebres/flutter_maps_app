import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_maps/blocs/blocs.dart';
import 'package:flutter_maps/widgets/custom_snackbar.dart';

class BtnLocation extends StatelessWidget {
  const BtnLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 0,
        onPressed: () {
          final userLocation = locationBloc.state.lastKnownLocation;

          if (userLocation == null) {
            final snackBar = CustomSnackBar(message: 'No hay ubicación');
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);

            return;
          }

          mapBloc.moveCamera(userLocation);
        },
        child: const Icon(
          Icons.my_location_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
