import 'package:flutter/material.dart';
import 'package:youtube/api/youtube_api.dart';
import 'package:youtube/model/data.dart';
import 'package:youtube/widgets/video_card.dart';
import 'package:youtube/widgets/widgets.dart';
import 'package:youtube/widgets/cutom_sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Video>> _videos;
  late Future<List<Category>> _categories = Future.value([]); // Initialize with an empty list
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _videos = YouTubeAPI().fetchVideos();
    _categories = YouTubeAPI().fetchCategories();
  }

  void _loadCategoryVideos(String categoryId) {
    setState(() {
      _videos = YouTubeAPI().fetchVideosByCategory(categoryId).catchError((error) {
        print('Error fetching category videos: $error');
        return [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset(
                  'assets/yt_logo_dark.png',
                  width: 10,
                  height: 5,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(),
              SliverToBoxAdapter(
                child: FutureBuilder<List<Category>>(
                  future: _categories,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No categories found'));
                    } else {
                      final categories = snapshot.data!;
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        height: 35, // Increased height here
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 46, 46, 46),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.explore,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            for (int i = 0; i < categories.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = i + 1;
                                      _loadCategoryVideos(categories[i].id);
                                      print("Selected category: ${categories[i].title}");
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == i + 1 ? Colors.white : const Color.fromARGB(255, 46, 46, 46),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        categories[i].title,
                                        style: TextStyle(
                                          color: selectedIndex == i + 1 ? Colors.black : Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 60.0, top: 10.0), // Added top padding here
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
                            // return VideoCard(video: video);
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
          );
        },
      ),
    );
  }

  // Remove the hardcoded genreList
}
