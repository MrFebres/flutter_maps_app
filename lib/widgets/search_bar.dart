import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_maps/blocs/blocs.dart';
import 'package:flutter_maps/models/models.dart';
import 'package:flutter_maps/widgets/destination_delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) =>
          state.displayManualMarker ? const SizedBox() : const _SearchBarBody(),
    );
  }
}

class _SearchBarBody extends StatelessWidget {
  const _SearchBarBody({Key? key}) : super(key: key);

  void _onSearchResults(BuildContext context, SearchResults result) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    if (result.manual) {
      searchBloc.add(ActivateManualMarker());

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: FadeInDown(
          duration: const Duration(milliseconds: 300),
          child: ElevatedButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: DestinationDelegate(),
              ).then((value) =>
                  (value == null) ? null : _onSearchResults(context, value));
            },
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              elevation: MaterialStateProperty.all(5.0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('¿A donde quieres ir?'),
            ),
          ),
        ),
      ),
    );
  }
}
