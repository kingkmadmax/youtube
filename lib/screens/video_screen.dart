import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/model/data.dart';
import 'package:youtube/screens/nav_screen.dart';
import 'package:youtube/widgets/video_card.dart';
import 'package:youtube/widgets/video_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends ConsumerStatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  ScrollController? _scrollController;
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    final selectedVideo = ref.read(selectedVideoProvider);
    _youtubeController = YoutubePlayerController(
      initialVideoId: selectedVideo?.id ?? '8oIsZEhnqtA',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _youtubeController.dispose();
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
                                controller: _youtubeController,
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
                        ref.read(selectedVideoProvider.notifier).state = video;
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