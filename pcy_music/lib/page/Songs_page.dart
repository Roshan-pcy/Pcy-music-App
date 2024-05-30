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
              body: Padding(
                padding: const EdgeInsets.only(left: 11, right: 10, top: 10),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back),
                        Text('P L A  Y  L I S T'),
                        Icon(Icons.menu),
                      ],
                    ),
                    NeoBox(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/img1.jpg',
                              fit: BoxFit.fill,
                            )))
                  ],
                ),
              )),
        );
      },
    );
  }
}
