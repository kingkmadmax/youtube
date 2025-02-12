import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/model/data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoStateNotifier extends StateNotifier<Video?> {
VideoStateNotifier() : super(null);

void selectVideo(Video video) {
state = video;
}

void clearVideo() {
state = null;
}
}
final miniPlayerControllerProvider = StateProvider<MiniplayerController>((ref) {
return MiniplayerController();
});

final selectedVideoProvider = StateNotifierProvider<VideoStateNotifier, Video?>((ref) {
return VideoStateNotifier();
});

final youtubePlayerControllerProvider = StateNotifierProvider<YoutubePlayerControllerNotifier, YoutubePlayerController?>((ref) {
final selectedVideo = ref.watch(selectedVideoProvider);
return YoutubePlayerControllerNotifier(selectedVideo);
});

class YoutubePlayerControllerNotifier extends StateNotifier<YoutubePlayerController?> {
YoutubePlayerControllerNotifier(Video? video)
: super(video != null
? YoutubePlayerController(
initialVideoId: video.id,
flags: const YoutubePlayerFlags(
autoPlay: true,
mute: false,
),
)
: null);

void updateVideo(Video video) {
state?.load(video.id);
}

void disposeController() {
state?.dispose();
}
}