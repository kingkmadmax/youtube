import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube/model/user.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube/widgets/popups/description_popoup.dart';
import 'package:youtube/api/youtube_api.dart';
import 'package:youtube/model/comment.dart';
import 'package:youtube/widgets/popups/comments_popoup.dart';
import 'package:youtube/screens/channel_page.dart';

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(
            video.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${video.viewCount} views • ${timeago.format(video.timestamp)}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => DescriptionPopout(description: video.description, title: video.title),
                  );
                },
                child: Text(
                  "...more",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChannelPage(channelId: video.channelId),
                ),
              );
            },
            child: _AuthorInfo(user: video.author),
          ),
          const SizedBox(height: 15),
          _ActionsRow(video: video),
          const SizedBox(height: 15),
         
          _FirstCommentSection(videoId: video.id),
        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final Video video;

  const _ActionsRow({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Like and Dislike in one box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromARGB(255, 32, 32, 32),
            ),
            child: Row(
              children: [
                Icon(Icons.thumb_up_outlined, size: 20.0),
                const SizedBox(width: 4.0),
                Text('${video.likes}'),
                const SizedBox(width: 8.0),
                Icon(Icons.thumb_down_outlined, size: 20.0),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          _buildActionBox(context, Icons.share_outlined, 'Share'),
          const SizedBox(width: 8.0),
          _buildActionBox(context, Icons.auto_awesome_mosaic_outlined, 'Remix'),
          const SizedBox(width: 8.0),
          _buildActionBox(context, Icons.download_outlined, 'Download'),
          const SizedBox(width: 8.0),
          _buildActionBox(context, Icons.content_cut_outlined, 'Clip'),
          const SizedBox(width: 8.0),
          _buildActionBox(context, Icons.library_add_outlined, 'Save'),
          const SizedBox(width: 8.0),
          _buildActionBox(context, Icons.report_outlined, 'Report'),
        ],
      ),
    );
  }

  Widget _buildActionBox(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromARGB(255, 32, 32, 32),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.0),
          const SizedBox(width: 4.0),
          Text(label),
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(user.profileImageUrl),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  user.username,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold,),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            'Subscribe',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black)
          ),
        ),
      ],
    );
  }
}

class _FirstCommentSection extends StatelessWidget {
  final String videoId;

  const _FirstCommentSection({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comment>>(
      future: YouTubeAPI().fetchCommentsByVideoId(videoId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No comments found'));
        } else {
          final comments = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(height: 8.0),
              Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 32, 32, 32),
        borderRadius: BorderRadius.circular(12),
      ),
      child:   GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => CommentsPopout(comments: comments),
                  );
                },
                child:
                
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comments',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14.0,  fontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 10),
Row(
        children: [
            CircleAvatar(
            radius: 15.0,
            foregroundImage: NetworkImage(comments[0].authorProfileImageUrl),
            ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
     
                Text(
                  comments[0].text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
           
              ],
            ),
          ),
        ],
      ),
              
            ],
        
    ),
          
            )  )],
          );
        }
      },
    );
  }
}

// class _CommentsPopup extends StatelessWidget {
//   final List<Comment> comments;

//   const _CommentsPopup({
//     Key? key,
//     required this.comments,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.6,
//       minChildSize: 0.3,
//       maxChildSize: 0.9,
//       expand: false,
//       builder: (context, scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//           ),
//           child: SingleChildScrollView(
//             controller: scrollController,
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Container(
//                       width: 40,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[600],
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                       Container(
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 32, 32, 32),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: 
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Comments",
//                         style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.close, color: Colors.white),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                     ],
//                   ),
//                       ),
//                   Divider(color: Colors.grey[600]),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: comments.length,
//                     itemBuilder: (context, index) {
//                       final comment = comments[index];
//                       return Row(
//         children: [
//           CircleAvatar(
//             foregroundImage: NetworkImage(comment.authorProfileImageUrl),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       comment.authorName,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Text(
//                       comment.timeAgo,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   comment.text,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(Icons.thumb_up, color: Colors.grey, size: 14),
//                     SizedBox(width: 5),
//                     Text(
//                       comment.likeCount.toString(),
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }