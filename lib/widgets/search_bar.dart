import 'package:flutter/material.dart';

import 'package:flutter_maps/widgets/destination_delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final result = await showSearch(
              context: context,
              delegate: DestinationDelegate(),
            );

            if (result == null) return;

            print(result);
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
    );
  }
}
