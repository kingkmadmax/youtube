
import 'package:flutter/material.dart';


class ChannelPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://placehold.co/400x200'),
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
                    backgroundImage: NetworkImage('https://placehold.co/80'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Channel Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('@username'),
                      Text('1000 subscribers • 7.1K videos'),
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
                  child: Text('SUBSCRIBE'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
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
                        Center(child: Text('Videos Content')),
                        Center(child: Text('Playlist Content')),
                        Center(child: Text('Posts Content')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('For You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (index) => VideoCard()),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(5, (index) => SmallVideoCard()),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://placehold.co/200x100', fit: BoxFit.cover),
          Text('Video Title', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('1M views • 1 day ago'),
        ],
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