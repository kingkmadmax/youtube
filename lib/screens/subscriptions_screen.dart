import 'package:flutter/material.dart';
import 'package:youtube/widgets/cutom_sliver_app_bar.dart';
//import 'package:flutter_youtube_ui/widgets/cutom_sliver_app_bar.dart';
import 'package:youtube/widgets/genre_buttons.dart';

import 'all_channels_page.dart'; // Import the new page

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> channels = [
      {
        'profilePic':
            'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Tech Channel',
        'isLive': true,
      },
      {
        'profilePic':
            'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'DevLive',
        'isLive': false,
      },
      {
        'profilePic':
            'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Flutter Guru',
        'isLive': false,
      },
      {
        'profilePic':
            'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Code With Me',
        'isLive': true,
      },
      {
        'profilePic':
            'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'UI Design Pro',
        'isLive': true,
      },
      {
        'profilePic':
            'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Data Science Hub',
        'isLive': true,
      },
    ];

    final List<Map<String, dynamic>> videos = [
      {
        'thumbnail': 'https://i.ytimg.com/vi/bScxXio_gH8/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAMSzfuVDNiJ_sm9mwNgUWZd7LGgQ',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH1',
        'title': 'How to Build a Flutter App - Full Guide',
        'channelName': 'Tech Channel',
        'views': '1.2M views',
        'uploadTime': '2 days ago',
        'isLive': false,
      },
      {
        'thumbnail': 'https://i.ytimg.com/vi/lBXPgprZAZM/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDTe_8Qygn4DET5i5yjH227rotqtA',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH2',
        'title': 'Live Coding Session - Flutter UI Design',
        'channelName': 'DevLive',
        'views': '5.3K watching',
        'uploadTime': 'LIVE',
        'isLive': true,
      },
      {
        'thumbnail': 'https://i.ytimg.com/vi/NIUtyzuFFOM/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC8uyPuMz-1sQGjLiZyIXiZ__TtRw',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH3',
        'title': 'Top 10 Flutter Packages You Should Know',
        'channelName': 'Flutter Guru',
        'views': '730K views',
        'uploadTime': '1 week ago',
        'isLive': false,
      },
      {
        'thumbnail': 'https://i9.ytimg.com/vi/X3ARdNAAnXI/hq720_custom_2.jpg?sqp=CKyat70G-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCNlQ9Qk18iKM3qU5iBmq1PqhPxrw',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH3',
        'title': 'Top 10 Flutter Packages You dont Should Know',
        'channelName': 'Flutter Guru',
        'views': '730K views',
        'uploadTime': '1 week ago',
        'isLive': false,
      },
      {
        'thumbnail': 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH3',
        'title': 'Top 10 Flutter Packages You not Should Know',
        'channelName': 'Flutter Guru',
        'views': '730K views',
        'uploadTime': '1 week ago',
        'isLive': false,
      },
    ];

    // Sample genre list
    final List<String> genreList = ['Tech', 'Gaming', 'Music', 'Education', 'Sports', 'News', 'Film & Animation', 'Pets & Animals', 'Travel & Events', 'Videoblogging', 'How-to', 'Education', 'Autos & Vehicles', 'Sustainability', ];

    // Track selected index for genre buttons
    int selectedIndex = 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),

            // Scrollable Channel Avatars with Active Status Indicator
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Scrollable Channel Avatars (Profiles)
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          itemCount: channels.length,
                          itemBuilder: (context, index) {
                            final channel = channels[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            NetworkImage(channel['profilePic']),
                                      ),
                                      if (channel['isLive'])
                                        Positioned(
                                          bottom: 3,
                                          right: 3,
                                          child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      channel['name'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // "All" Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to AllChannelsPage with slide transition
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                       AllChannelsPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(
                                    1.0, 0.0); // Slide from right to left
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                    position: offsetAnimation, child: child);
                              },
                            ),
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors
                                    .transparent, // Customize button color
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'All',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Genre Buttons (Underneath Profile Avatars)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: GenreButtons(
                  genreList: genreList,
                  selectedIndex: selectedIndex,
                  onGenreSelected: (index) {
                    // Update the selected genre index
                    selectedIndex = index;
                  },
                  onExplorerPressed: () {},
                ),
              ),
            ),

            // Subscription Feed (Videos)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];
                  return InkWell(
                    onTap: () {
                      print("Tapped on: ${video['title']}");
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(video['thumbnail'],
                                width: double.infinity,
                                height: 220,
                                fit: BoxFit.cover),
                            if (video['isLive'])
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text('LIVE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                          ],
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(video['channelLogo']),
                          ),
                          title: Text(
                            video['title'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${video['channelName']} • ${video['views']} • ${video['uploadTime']}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                          trailing:
                              const Icon(Icons.more_vert, color: Colors.white),
                        ),
                        
                      ],
                    ),
                  );
                },
                childCount: videos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> channels = [
      {
        'profilePic': 'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Tech Channel',
        'isLive': true,
      },
      {
        'profilePic': 'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'DevLive',
        'isLive': false,
      },
      {
        'profilePic': 'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Flutter Guru',
        'isLive': false,
      },
      {
        'profilePic': 'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Code With Me',
        'isLive': true,
      },
      {
        'profilePic': 'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'UI Design Pro',
        'isLive': true,
      },
      {
        'profilePic': 'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
        'name': 'Data Science Hub',
        'isLive': true,
      },
    ];

    final List<Map<String, dynamic>> videos = [
      {
        'thumbnail': 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH1',
        'title': 'How to Build a Flutter App - Full Guide',
        'channelName': 'Tech Channel',
        'views': '1.2M views',
        'uploadTime': '2 days ago',
        'isLive': false,
      },
      {
        'thumbnail': 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH2',
        'title': 'Live Coding Session - Flutter UI Design',
        'channelName': 'DevLive',
        'views': '5.3K watching',
        'uploadTime': 'LIVE',
        'isLive': true,
      },
      {
        'thumbnail': 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
        'channelLogo': 'https://via.placeholder.com/50.png?text=CH3',
        'title': 'Top 10 Flutter Packages You Should Know',
        'channelName': 'Flutter Guru',
        'views': '730K views',
        'uploadTime': '1 week ago',
        'isLive': false,
      },
    ];

    // Sample genre list
    final List<String> genreList = ['Tech', 'Gaming', 'Music', 'Education', 'Sports', 'Animals', 'Food', 'Travel', 'Pets', 'Gardening', 'Fashion', 'Books', 'Science', 'Arts', 'News',];

    // Track selected index for genre buttons
    int selectedIndex = 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),

            // Scrollable Channel Avatars with Active Status Indicator
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    // Scrollable Channel Avatars (Profiles)
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          itemCount: channels.length,
                          itemBuilder: (context, index) {
                            final channel = channels[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(channel['profilePic']),
                                      ),
                                      if (channel['isLive'])
                                        Positioned(
                                          bottom: 3,
                                          right: 3,
                                          child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.black, width: 2),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      channel['name'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white, fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    
                    // "All" Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle "All" button tap here
                          print('All button tapped');
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.transparent,  // Customize button color
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'All',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Genre Buttons (Underneath Profile Avatars)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 9.0),
                child: GenreButtons(
                  genreList: genreList,
                  selectedIndex: selectedIndex,
                  onGenreSelected: (index) {
                    // Update the selected genre index
                    selectedIndex = index;
                  }, onExplorerPressed: () {  },
                ),
              ),
            ),

            // Subscription Feed (Videos)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];
                  return InkWell(
                    onTap: () {
                      print("Tapped on: ${video['title']}");
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(video['thumbnail'], width: double.infinity, height: 180, fit: BoxFit.cover),
                            if (video['isLive'])
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text('LIVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                          ],
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(video['channelLogo']),
                          ),
                          title: Text(
                            video['title'],
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${video['channelName']} • ${video['views']} • ${video['uploadTime']}',
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.more_vert, color: Colors.white),
                        ),
                        const Divider(color: Colors.grey),
                      ],
                    ),
                  );
                },
                childCount: videos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
    
/*Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return InkWell(
            onTap: () {
              // Navigate to Video Detail Page (for now, just print)
              print("Tapped on: ${video['title']}");
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(video['thumbnail'], width: double.infinity, height: 180, fit: BoxFit.cover),
                    if (video['isLive'])
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('LIVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(video['channelLogo']),
                  ),
                  title: Text(
                    video['title'],
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${video['channelName']} • ${video['views']} • ${video['uploadTime']}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  trailing: const Icon(Icons.more_vert, color: Colors.white),
                ),
                const Divider(color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );*/
  

