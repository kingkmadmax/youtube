import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/model/data.dart';
import 'home_screen.dart';
import 'package:youtube/screens/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class NavScreen extends ConsumerStatefulWidget {
  const NavScreen({super.key});

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends ConsumerState<NavScreen> {
  int _selectedIndex = 0;
  static const double _playerMinHeight = 60.0;
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    final selectedVideo = ref.read(selectedVideoProvider);
    _youtubeController = YoutubePlayerController(
      initialVideoId: selectedVideo?.id ?? '8oIsZEhnqtA',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text('Explore'))),
    const Scaffold(body: Center(child: Text('Add'))),
    const Scaffold(body: Center(child: Text('Subscriptions'))),
    const Scaffold(body: Center(child: Text('Library'))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedVideo = ref.watch(selectedVideoProvider);
    final miniPlayerController = ref.watch(miniPlayerControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          ..._screens.asMap().entries.map((entry) {
            int idx = entry.key;
            Widget screen = entry.value;
            return Offstage(
              offstage: _selectedIndex != idx,
              child: screen,
            );
          }).toList(),
          if (selectedVideo != null)
            Miniplayer(
              controller: miniPlayerController,
              minHeight: _playerMinHeight,
              maxHeight: MediaQuery.of(context).size.height,
              builder: (height, percentage) {
                if (height <= _playerMinHeight + 4.0) {
                  return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            YoutubePlayer(
                              controller: _youtubeController,
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
                            IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () {
                                _youtubeController.play();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.pause),
                              onPressed: () {
                                _youtubeController.pause();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                ref.read(selectedVideoProvider.notifier).state = null;
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
                  return VideoScreen();
                }
              },
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            activeIcon: Icon(Icons.play_circle_filled),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 24),
                ),
              ),
            ),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: 'Subscriptions',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}