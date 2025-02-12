import 'package:flutter/material.dart';
import 'package:youtube/model/data.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube/widgets/description_popout.dart';

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
                    builder: (context) => DescriptionPopout(),
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
              const SizedBox(height: 20),
          _ActionsRow(video: video),
          const SizedBox(height: 20),
          _AuthorInfo(user: video.author),
          // const Divider(),
          // _CommentsSection(video: video),
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
    return GestureDetector(
      onTap: () => print('Navigate to profile'),
      child: Row(
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
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.0),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${user.subscribers} subscribers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14.0),
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
      ),
    );
  }
}
// class _CommentsSection extends StatelessWidget {
//   final Video video;

//   const _CommentsSection({
//     Key? key,
//     required this.video,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Comments',
//           style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.0),
//         ),
//         const SizedBox(height: 8.0),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: video.comments.length,
//           itemBuilder: (context, index) {
//             final comment = video.comments[index];
//             return ListTile(
//               leading: CircleAvatar(
//                 foregroundImage: NetworkImage(comment.user.profileImageUrl),
//               ),
//               title: Text(comment.user.username),
//               subtitle: Text(comment.text),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }