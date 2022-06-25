import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/blocs/blocs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  const MapView({
    Key? key,
    required this.initialLocation,
  }) : super(key: key);

  final LatLng initialLocation;

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Listener(
        onPointerMove: (event) => mapBloc.add(StopFollowingUserInMap()),
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          onMapCreated: (controller) => mapBloc.add(InitializedMap(controller)),
          zoomControlsEnabled: false,
        ),
      ),
    );
  }
}
