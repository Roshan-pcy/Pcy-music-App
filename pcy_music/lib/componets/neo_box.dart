import 'package:flutter/material.dart';
import 'package:pcy_music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NeoBox extends StatelessWidget {
  final Widget child;
  const NeoBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isdarkmood = Provider.of<ThemeProvider>(context).isDarkMode;
    print("dark mode is ${isdarkmood}");
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              color: isdarkmood
                  ? Color.fromARGB(255, 11, 10, 10)
                  : Colors.grey.shade500,
              offset: const Offset(4, 4)),
          BoxShadow(
              blurRadius: 15,
              color: isdarkmood ? Colors.grey.shade800 : Colors.white,
              offset: const Offset(-4, -4)),
        ],
      ),
      child: child,
    );
  }
}
