import 'package:flutter/material.dart';
import 'package:pcy_music/componets/neo_box.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back),
                        Text('P L A  Y  L I S T'),
                        Icon(Icons.menu),
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
