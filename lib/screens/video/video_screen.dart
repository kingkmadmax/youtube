import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube/screens/nav_screen.dart';
import 'package:youtube/state_management/video_provider.dart';
import 'package:youtube/widgets/video_card.dart';
import 'package:youtube/widgets/video_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube/api/youtube_api.dart';

class VideoScreen extends ConsumerStatefulWidget {
final YoutubePlayerController youtubeController;

VideoScreen({required this.youtubeController});

@override
_VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
ScrollController? _scrollController;
bool _isPlaying = false;
late Future<List<Video>> _suggestedVideos;

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
final categoryId = ref.read(selectedVideoProvider)?.categoryId ?? '';
_suggestedVideos = YouTubeAPI().fetchVideosByCategory(categoryId).catchError((error) {
print('Error fetching suggested videos: $error');
return [];
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
value: 0.04,
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
SliverPadding(
padding: const EdgeInsets.only(bottom: 60.0),
sliver: FutureBuilder<List<Video>>(
future: _suggestedVideos,
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return SliverToBoxAdapter(
child: Center(child: CircularProgressIndicator()),
);
} else if (snapshot.hasError) {
return SliverToBoxAdapter(
child: Center(child: Text('Error: ${snapshot.error}')),
);
} else if (!snapshot.hasData || snapshot.data!.isEmpty) {
return SliverToBoxAdapter(
child: Center(child: Text('No suggested videos found')),
);
} else {
return SliverList(
delegate: SliverChildBuilderDelegate(
(context, index) {
final video = snapshot.data![index];
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
childCount: snapshot.data?.length ?? 0,
),
);
}
},
),
),
],
),
),
),
);
}
}