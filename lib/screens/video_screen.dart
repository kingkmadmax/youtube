import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/model/data.dart';
import 'package:youtube/providers/video_provider.dart';
import 'package:youtube/screens/nav_screen.dart';
import 'package:youtube/widgets/video_card.dart';
import 'package:youtube/widgets/video_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends ConsumerStatefulWidget {
final YoutubePlayerController youtubeController;

VideoScreen({required this.youtubeController});

@override
_VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
ScrollController? _scrollController;
bool _isPlaying = false;

@override
void initState() {
super.initState();
_scrollController = ScrollController();
widget.youtubeController.addListener(() {
if (mounted) {
setState(() {
_isPlaying = widget.youtubeController.value.isPlaying;
});
}
});
}

@override
void dispose() {
_scrollController?.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: () {
final miniPlayerController = ref.read(miniPlayerControllerProvider.notifier);
miniPlayerController.state.animateToHeight(state: PanelState.MAX);
},
child: Scaffold(
body: Container(
color: Theme.of(context).scaffoldBackgroundColor,
child: CustomScrollView(
controller: _scrollController,
shrinkWrap: true,
slivers: [
SliverToBoxAdapter(
child: Consumer(
builder: (context, ref, _) {
final selectedVideo = ref.watch(selectedVideoProvider);
return SafeArea(
child: Column(
children: [
Stack(
children: [
YoutubePlayer(
controller: widget.youtubeController,
showVideoProgressIndicator: true,
progressIndicatorColor: Colors.red,
progressColors: ProgressBarColors(
playedColor: Colors.red,
handleColor: Colors.redAccent,
),
onReady: () {
// Do something when the player is ready
},
),
IconButton(
iconSize: 30.0,
icon: const Icon(Icons.keyboard_arrow_down),
onPressed: () {
final miniPlayerController =
ref.read(miniPlayerControllerProvider.notifier);
miniPlayerController.state
.animateToHeight(state: PanelState.MIN);
},
),
],
),
const LinearProgressIndicator(
value: 0.4,
valueColor: AlwaysStoppedAnimation<Color>(
Colors.red,
),
),
selectedVideo != null
? VideoInfo(video: selectedVideo)
: const Center(child: Text('No video selected')),
],
),
);
},
),
),
SliverList(
delegate: SliverChildBuilderDelegate(
(context, index) {
final video = suggestedVideos[index];
return VideoCard(
video: video,
hasPadding: true,
onTap: () {
ref.read(selectedVideoProvider.notifier).selectVideo(video);
ref.read(youtubePlayerControllerProvider.notifier).updateVideo(video);
_scrollController!.animateTo(
0,
duration: const Duration(milliseconds: 200),
curve: Curves.easeIn,
);
},
);
},
childCount: suggestedVideos.length,
),
),
],
),
),
),
);
}
}