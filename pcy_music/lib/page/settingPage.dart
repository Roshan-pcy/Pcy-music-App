import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: Text(
        'S E T T I N G',
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),
      ),
    ));
  }
}
