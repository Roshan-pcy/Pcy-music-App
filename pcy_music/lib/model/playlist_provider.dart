import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pcy_music/model/song.dart';
import 'package:provider/provider.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "Bewafa..",
        artistName: "Arjith",
        albumArtImagePath: "assets/images/img1.jpg",
        audiopath: "audio/Bewafa.mp3"),
    Song(
        songName: "Channa Mereya",
        artistName: "Arjith",
        albumArtImagePath: "assets/images/img2.jpg",
        audiopath: "audio/Channa_Mereya.mp3"),
    Song(
        songName: "Lutu Put Gaya",
        artistName: "Arjith",
        albumArtImagePath: "assets/images/img3.jpg",
        audiopath: "audio/Lutt_Putt_Gaya.mp3")
  ];
//current index of song playing
  int? _currentSongIndex;

  /*
Getters
    */
  List<Song> get playlist => _playlist;
  int? get currentIndex => _currentSongIndex;
  bool get isitPlaying => isPlaying;
  Duration get currentDuration => _currectDuration;
  Duration get totalDuration => _totalDuration;
  /*
setters
    */
  set setIndex(int? index) {
    _currentSongIndex = index;
    if (index != null) {
      play();
    }
    notifyListeners();
  }

  /* audio player*/

  //audio player

  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration
  Duration _currectDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  PlaylistProvider() {
    listenDUration();
  }
  //construction

//initaily not playing
  bool isPlaying = true;

//play the song
  void play() async {
    final String path = _playlist[currentIndex!].audiopath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    notifyListeners();
  }

//pause the song
  void pasue() async {
    await _audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

//resume the song
  void resume() async {
    await _audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }
// pause or resume

  void pauseOrResume() {
    if (isPlaying) {
      pasue();
    } else {
      resume();
    }
    notifyListeners();
  }

//specific postion of song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

//play next song
  void palyNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        _currentSongIndex = _currentSongIndex! + 1;
        isPlaying = true;
        play();
      } else {
        _currentSongIndex = 0;
        isPlaying = true;
        play();
      }
    }
  }

// previous song
  void playPreviousSong() {
    if (_currectDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        _currentSongIndex = _currentSongIndex! - 1;
        play();
      } else {
        _currentSongIndex = _playlist.length - 1;
        play();
      }
    }
  }

//listen to duration
  void listenDUration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen(
      (duration) {
        _totalDuration = duration;
        notifyListeners();
      },
    );
    // listen for currecnt duration
    _audioPlayer.onPositionChanged.listen(
      (newPosition) {
        _currectDuration = newPosition;

        notifyListeners();
      },
    );

    _audioPlayer.onPlayerComplete.listen(
      (event) => palyNextSong(),
    );
  }

//dispose the auido player

//listenduration
}
