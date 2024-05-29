import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcy_music/componets/drawer.dart';
import 'package:pcy_music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyHomePape extends StatelessWidget {
  const MyHomePape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerUi(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: const Text(
            'P L A Y L I S T',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        body: const Text('hello'));
  }
}
