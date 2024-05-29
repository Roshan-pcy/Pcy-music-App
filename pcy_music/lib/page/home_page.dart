import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcy_music/componets/drawer.dart';
import 'package:pcy_music/model/playlist_provider.dart';
import 'package:pcy_music/model/song.dart';
import 'package:pcy_music/page/Songs_page.dart';
import 'package:pcy_music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyHomePape extends StatefulWidget {
  const MyHomePape({super.key});

  @override
  State<MyHomePape> createState() => _MyHomePapeState();
}

class _MyHomePapeState extends State<MyHomePape> {
  late final PlaylistProvider playlistProvider;
  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int index) {
    playlistProvider.setIndex = index;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SongsPage(),
        ));
  }

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
        body: Consumer<PlaylistProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.playlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    goToSong(index);
                  },
                  title: Text(value.playlist[index].songName),
                  subtitle: Text(value.playlist[index].artistName),
                  leading: SizedBox(
                      height: 60,
                      width: 50,
                      child: ClipRRect(
                          child: Image.asset(
                        value.playlist[index].albumArtImagePath,
                        fit: BoxFit.fill,
                      ))),
                );
              },
            );
          },
        ));
  }
}
