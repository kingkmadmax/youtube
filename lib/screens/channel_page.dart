import 'package:flutter/material.dart';
import 'package:youtube/api/youtube_api.dart';
import 'package:youtube/model/data.dart';
import 'package:youtube/widgets/video_card.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChannelPage extends StatefulWidget {
  final String channelId;

  const ChannelPage({super.key, required this.channelId});

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  late Future<Channel> _channelInfo;
  late Future<List<Video>> _channelVideos;
  String _selectedFilter = 'Latest';

  @override
  void initState() {
    super.initState();
    _channelInfo = YouTubeAPI().fetchChannelInfo(widget.channelId);
    _channelVideos = YouTubeAPI().fetchVideosByChannel(widget.channelId);
  }

  void _filterVideos(String filter) {
    setState(() {
      _selectedFilter = filter;
      // Update _channelVideos based on the selected filter
      // For simplicity, assuming fetchVideosByChannel can take a filter parameter
      _channelVideos = YouTubeAPI().fetchVideosByChannel(widget.channelId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.cast), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<Channel>(
              future: _channelInfo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No channel information found'));
                } else {
                  final channel = snapshot.data!;
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(channel.bannerImageUrl),   
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(channel.profileImageUrl),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(channel.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('@${channel.title}'),
                                Text('${channel.subscriberCount} subscribers'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Subscribe',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          ),
                        ),
                      ),

           
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          channel.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                    ],
                  );
                }
              },
            ),

           
            DefaultTabController(
              length: 4,
              child: Column(
              children: [
                TabBar(
                labelColor: Colors.white ,
                indicatorColor: Colors.white,
                indicatorWeight: 2.0,
                labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'Videos'),
                  Tab(text: 'Playlist'),
                  Tab(text: 'Posts'),
                ],
                ),
                  Container(
                    height: 500,
                    child: TabBarView(
                      children: [
                        FutureBuilder<List<Video>>(
                          future: _channelVideos,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(child: Text('No videos found'));
                            } else {
                              return SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                    'For you',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      final video = snapshot.data![index];
                                      return VideoCard(video: video);
                                    },
                                    ),
                                  ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ChoiceChip(
                                label: Text(
                                  'Latest',
                                  style: TextStyle(
                                  color: _selectedFilter == 'Latest' ? Colors.black : Colors.white,
                                  ),
                                ),
                                selected: _selectedFilter == 'Latest',
                                selectedColor: Colors.white,
                                backgroundColor: const Color.fromARGB(255, 24, 24, 24),
                                onSelected: (selected) {
                                  if (selected) _filterVideos('Latest');
                                },
                                ),
                                SizedBox(width: 8.0),
                                ChoiceChip(
                                label: Text(
                                  'Popular',
                                  style: TextStyle(
                                  color: _selectedFilter == 'Popular' ? Colors.black : Colors.white,
                                  ),
                                ),
                                selected: _selectedFilter == 'Popular',
                                selectedColor: Colors.white,
                                backgroundColor:const Color.fromARGB(255, 24, 24, 24),
                                onSelected: (selected) {
                                  if (selected) _filterVideos('Popular');
                                },
                                ),
                                SizedBox(width: 8.0),
                                ChoiceChip(
                                label: Text(
                                  'Oldest',
                                  style: TextStyle(
                                  color: _selectedFilter == 'Oldest' ? Colors.black : Colors.white,
                                  ),
                                ),
                                selected: _selectedFilter == 'Oldest',
                                selectedColor: Colors.white,
                                backgroundColor: const Color.fromARGB(255, 24, 24, 24),
                                onSelected: (selected) {
                                  if (selected) _filterVideos('Oldest');
                                },
                                ),
                              ],
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<Video>>(
                                future: _channelVideos,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Center(child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(child: Text('Error: ${snapshot.error}'));
                                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                    return Center(child: Text('No videos found'));
                                  } else {
                                    return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        final video = snapshot.data![index];
                                        return SmallVideoCard(video: video);
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Center(child: Text('Playlist Content')),
                        Center(child: Text('Posts Content')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallVideoCard extends StatelessWidget {
  final Video video;

  const SmallVideoCard({Key? key, required this.video}) : super(key: key);

  String _formatViews(String viewCount) {
    final int views = int.tryParse(viewCount) ?? 0;
    if (views >= 1000000) {
      return '${(views / 1000000).toStringAsFixed(1)}M views';
    } else if (views >= 1000) {
      return '${(views / 1000).toStringAsFixed(1)}K views';
    } else {
      return '$views views';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              video.thumbnailUrl ?? '',
              height: 90,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${_formatViews(video.viewCount)} • ${timeago.format(video.timestamp)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.more_vert, size: 20.0),
          ),
        ],
      ),
    );
  }
}