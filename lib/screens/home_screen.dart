import 'package:flutter/material.dart';
import 'package:youtube/api/youtube_api.dart';
import 'package:youtube/model/data.dart';
import 'package:youtube/widgets/video_card.dart';
import 'package:youtube/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Video>> _videos;

  @override
  void initState() {
    super.initState();
    _videos = YouTubeAPI().fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60.0),
            sliver: FutureBuilder<List<Video>>(
              future: _videos,
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
                    child: Center(child: Text('No videos found')),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final video = snapshot.data![index];
                        return VideoCard(video: video);
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
    );
  }
}
