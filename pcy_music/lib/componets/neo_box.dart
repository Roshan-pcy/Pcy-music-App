import 'package:flutter/material.dart';

class NeoBox extends StatelessWidget {
  final Widget child;
  const NeoBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              color: Colors.grey.shade500,
              offset: const Offset(4, 4)),
          const BoxShadow(
              blurRadius: 15, color: Colors.white, offset: Offset(-4, -4)),
        ],
      ),
      child: child,
    );
  }
}
