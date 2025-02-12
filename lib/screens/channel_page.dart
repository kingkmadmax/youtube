import 'package:flutter/material.dart';
import 'package:youtube/api/youtube_api.dart';
import 'package:youtube/model/data.dart';
import 'package:youtube/widgets/video_card.dart';

class ChannelPage extends StatefulWidget {
  final String channelId;

  const ChannelPage({super.key, required this.channelId});

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  late Future<Channel> _channelInfo;
  late Future<List<Video>> _channelVideos;

  @override
  void initState() {
    super.initState();
    _channelInfo = YouTubeAPI().fetchChannelInfo(widget.channelId);
    _channelVideos = YouTubeAPI().fetchVideosByChannel(widget.channelId);
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
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(channel.profileImageUrl),
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

                        //have only two lines of the description
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
            //add description here
           
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Home'),
                      Tab(text: 'Videos'),
                      Tab(text: 'Playlist'),
                      Tab(text: 'Posts'),
                    ],
                  ),
                  Container(
                    height: 200,
                    child: TabBarView(
                      children: [
                        Center(child: Text('Home Content')),
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
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final video = snapshot.data![index];
                                  return VideoCard(video: video);
                                },
                              );
                            }
                          },
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network('https://placehold.co/100x60', fit: BoxFit.cover),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Video Title', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('500K views • 2 days ago'),
            ],
          ),
        ],
      ),
    );
  }
}