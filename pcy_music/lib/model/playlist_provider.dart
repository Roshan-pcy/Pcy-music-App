import 'package:flutter/material.dart';
import 'package:pcy_music/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "Bewafa..",
        artistName: "Arjith",
        albumArtImagePath: "assets/images/img1.jpg",
        audiopath: "assets/audio/Bewafa.mp3"),
    Song(
        songName: "Channa Mereya",
        artistName: "Arjith",
        albumArtImagePath: "assets/images/img2.jpg",
        audiopath: "assets/audio/Channa_Mereya.mp3"),
    Song(
        songName: "Lutu Put Gaya",
        artistName: "Arjith",
        albumArtImagePath: "assets/images/img3.jpg",
        audiopath: "assets/audio/Lutt_Putt_Gaya.mp3")
  ];
//current index of song playing
  int? _currentSongIndex;

  /*
Getters
    */
  List<Song> get playlist => _playlist;
  int? get currentIndex => _currentSongIndex;

  /*
setters
    */
  set setIndex(int index) {
    _currentSongIndex = index;
  }
}
