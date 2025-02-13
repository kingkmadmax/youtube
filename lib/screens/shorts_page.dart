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
    'oDN7A2IRXYQ',
    'h8r_MyN_KY4',
    '2VdbQjMNLpk',
    'ZKTQSCKiwE4',
    'rcIdn4u45Ms',
    'WgWdcSg5_to',
  ];
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _videoIds.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return ShortsVideoPlayer(videoId: _videoIds[index]);
        },
      ),
    );
  }
}

class ShortsVideoPlayer extends StatefulWidget {
  final String videoId;

  const ShortsVideoPlayer({required this.videoId});

  @override
  _ShortsVideoPlayerState createState() => _ShortsVideoPlayerState();
}

class _ShortsVideoPlayerState extends State<ShortsVideoPlayer> {
  late YoutubePlayerController _controller;
  bool isLiked = false;
  bool isDisliked = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
         hideThumbnail: true,
        showLiveFullscreenButton: false,
        controlsVisibleAtStart: false,
        disableDragSeek: false,
        autoPlay: true,
        loop: true,
        mute: false,
        hideControls: true,
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) isDisliked = false;
    });
  }

  void _toggleDislike() {
    setState(() {
      isDisliked = !isDisliked;
      if (isDisliked) isLiked = false;
    });
  }

  void _shareVideo() {
    final url = "https://www.youtube.com/watch?v=${widget.videoId}";
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: false,
          progressIndicatorColor: Colors.white,
        ),
        builder: (context, player) {
          return Stack(
            children: [
              Positioned.fill(child: player), 

              Positioned(
                top: 40,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.search, color: Colors.white, size: 28),
                    SizedBox(width: 16),
                    Icon(Icons.more_vert, color: Colors.white, size: 28),
                  ],
                ),
              ),

              Positioned(
                right: 16,
                bottom: 120,
                child: Column(
                  children: [
                    ActionButton(
                      icon: Icons.thumb_up,
                      label: "1.2K",
                      isActive: isLiked,
                      onPressed: _toggleLike,
                    ),
                    ActionButton(
                      icon: Icons.thumb_down,
                      label: "Dislike",
                      isActive: isDisliked,
                      onPressed: _toggleDislike,
                    ),
                    ActionButton(
                      icon: Icons.comment,
                      label: "256",
                      onPressed: () {}, 
                    ),
                    ActionButton(
                      icon: Icons.share,
                      label: "Share",
                      onPressed: _shareVideo,
                    ),
                    ActionButton(
                      icon: Icons.music_note,
                      label: "Remix",
                      onPressed: () {}, 
                    ),
                  ],
                ),
              ),

          
            Positioned(
              left: 16,
              right: 16,
              bottom: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                  children: [
                    CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(Icons.person, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Text(
                    "@cleoabraham",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                  ),
                  SizedBox(width: 15,),
                  ElevatedButton(

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5), 
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text("Subscribe",
                    style: TextStyle(fontSize: 12),
                  ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 20,
              child: Text(
                "What if you just kept running UP?  #Shorts",
                style: TextStyle(color: Colors.white, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
     ) );
  }
}


class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isActive;

  const ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Icon(icon, color: isActive ? Colors.red : Colors.white, size: 28),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
        SizedBox(height: 16),
      ],
    );
  }
}
