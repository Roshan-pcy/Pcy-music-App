import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pcy_music/componets/neo_box.dart';
import 'package:pcy_music/model/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        final playlist = value.playlist;
        final currectSong = playlist[value.currentIndex ?? 0];

        return SafeArea(
          child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: Padding(
                padding: const EdgeInsets.only(left: 11, right: 10, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const Text('P L A  Y  L I S T'),
                          const Icon(Icons.menu),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      NeoBox(
                          child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                currectSong.albumArtImagePath,
                                fit: BoxFit.fill,
                                height: 250,
                                width: 300,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currectSong.songName,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      currectSong.songName,
                                    )
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('00:0'),
                                Icon(Icons.shuffle),
                                Icon(Icons.repeat),
                                Text('0:00')
                              ],
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8)),
                        child: Slider(
                          min: 0,
                          max: 100,
                          value: 50,
                          onChanged: (value) {},
                          activeColor: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: const NeoBox(
                                      child: Icon(Icons.skip_previous)))),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                              flex: 2,
                              child: GestureDetector(
                                  onTap: () {},
                                  child: const NeoBox(
                                      child: Icon(Icons.play_arrow)))),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: const NeoBox(
                                      child: Icon(Icons.skip_next))))
                        ],
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
