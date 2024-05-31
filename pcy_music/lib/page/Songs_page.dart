import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pcy_music/componets/neo_box.dart';
import 'package:pcy_music/model/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});
  String showdata(Duration duraion) {
    String twodigitsecond =
        duraion.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duraion.inMinutes}:${twodigitsecond}";
    return formattedTime;
  }

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
                                      currectSong.artistName,
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(showdata(value.currentDuration)),
                                const Icon(Icons.shuffle),
                                const Icon(Icons.repeat),
                                Text(showdata(value.totalDuration))
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
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          onChanged: (value) {},
                          activeColor: Colors.green,
                          onChangeEnd: (values) {
                            value.seek(Duration(seconds: values.toInt()));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                  onTap: value.playPreviousSong,
                                  child: const NeoBox(
                                      child: Icon(Icons.skip_previous)))),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                              flex: 2,
                              child: GestureDetector(
                                  onTap: value.pauseOrResume,
                                  child: NeoBox(
                                      child: value.isPlaying
                                          ? const Icon(Icons.pause)
                                          : const Icon(Icons.play_arrow)))),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                              child: GestureDetector(
                                  onTap: value.palyNextSong,
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
