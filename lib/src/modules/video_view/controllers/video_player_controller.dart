import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var videoPlayerProvider =
    ChangeNotifierProvider.autoDispose((ref) => VideoPlayerViewController());

class VideoPlayerViewController extends ChangeNotifier {
    var playVideo = false;
    setPlayer(bool value){
      playVideo = value;
      notifyListeners();
    }
}
