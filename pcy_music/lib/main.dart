import 'package:flutter/material.dart';
import 'package:pcy_music/model/playlist_provider.dart';
import 'package:pcy_music/page/home_page.dart';
import 'package:pcy_music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlaylistProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Provider.of<ThemeProvider>(context).getTheme,
          home: const MyHomePape()),
    );
  }
}
