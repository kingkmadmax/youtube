import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class ShortsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final List<String> _videoIds = [
    'dQw4w9WgXcQ', // Video 1
    '3JZ_D3ELwOQ', // Video 2
    '2Vv-BfVoq4g', // Video 3
  ];
  late PageController _pageController;
  late YoutubePlayerController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = _createController(_videoIds[_currentIndex]);
  }

  YoutubePlayerController _createController(String videoId) {
    return YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _controller.load(_videoIds[_currentIndex]);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Player with Slider'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blue,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _videoIds.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    'Video ${index + 1}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.play();
            },
            child: Text('Play Video'),
          ),
        ],
      ),
    );
  }
}
