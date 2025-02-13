import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/screens/profie/profile.dart';
import 'package:youtube/screens/channel_page.dart';
import 'package:youtube/screens/shorts_screen.dart';
import 'package:youtube/state_management/video_provider.dart';
import 'package:youtube/widgets/video_card.dart';
import 'home_screen.dart';
import 'package:youtube/screens/video/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube/widgets/custom_bottom_nav_bar.dart';
import 'package:youtube/widgets/nav_screens_list.dart';

class NavScreen extends ConsumerStatefulWidget {
  const NavScreen({super.key});

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends ConsumerState<NavScreen> {
  int _selectedIndex = 0;
  static const double _playerMinHeight = 80.0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedVideo = ref.watch(selectedVideoProvider);
    final miniPlayerController = ref.watch(miniPlayerControllerProvider);
    final youtubeController = ref.watch(youtubePlayerControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          ...navScreensList.asMap().entries.map((entry) {
            int idx = entry.key;
            Widget screen = entry.value;
            return Offstage(
              offstage: _selectedIndex != idx,
              child: screen,
            );
          }).toList(),
          if (selectedVideo != null && youtubeController != null)
            Miniplayer(
              controller: miniPlayerController,
              minHeight: _playerMinHeight,
              maxHeight: MediaQuery.of(context).size.height,
              builder: (height, percentage) {
                if (height <= _playerMinHeight + 50.0) {
                  return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            YoutubePlayer(
                              controller: youtubeController,
                              width: 120.0,
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.red,
                              progressColors: ProgressBarColors(
                                playedColor: Colors.red,
                                handleColor: Colors.redAccent,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        selectedVideo.title ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        selectedVideo.author.username ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            StatefulBuilder(
                              builder: (context, setState) {
                                return IconButton(
                                  icon: Icon(
                                    youtubeController.value.isPlaying
                                        ? Icons.play_arrow
                                        : Icons.pause,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (youtubeController.value.isPlaying) {
                                        youtubeController.pause();
                                      } else {
                                        youtubeController.play();
                                      }
                                    });
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                ref.read(selectedVideoProvider.notifier).clearVideo();
                                ref.read(youtubePlayerControllerProvider.notifier).disposeController();
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
                      ],
                    ),
                  );
                } else {
                  return VideoScreen(youtubeController: youtubeController);
                }
              },
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
