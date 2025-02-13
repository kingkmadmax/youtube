import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube/model/video.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import 'package:youtube/screens/channel_page.dart';
import 'package:youtube/state_management/video_provider.dart';

class VideoCard extends ConsumerWidget {
  final Video video;
  final bool hasPadding;
  final VoidCallback? onTap;

  const VideoCard({
    Key? key,
    required this.video,
    this.hasPadding = false,
    this.onTap,
  }) : super(key: key);

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
  
  String _formatDuration(String duration) {
    final regex = RegExp(r'PT(\d+H)?(\d+M)?(\d+S)?');
    final match = regex.firstMatch(duration);

    if (match == null) return duration;

    final hours = match.group(1)?.replaceAll('H', '') ?? '0';
    final minutes = match.group(2)?.replaceAll('M', '') ?? '0';
    final seconds = match.group(3)?.replaceAll('S', '') ?? '0';

    final formattedDuration = [
      if (int.parse(hours) > 0) hours.padLeft(2, '0'),
      minutes.padLeft(2, '0'),
      seconds.padLeft(2, '0')
    ].join(':');

    return formattedDuration;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedVideoProvider.notifier).selectVideo(video);
        ref.read(youtubePlayerControllerProvider.notifier).updateVideo(video);

        print('selected video: ${video.title}');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(miniPlayerControllerProvider.notifier)
              .state
              .animateToHeight(state: PanelState.MAX);
        });
        if (onTap != null) onTap!();
      },
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: hasPadding ? 12.0 : 0,
                ),
                child: Image.network(
                  video.thumbnailUrl ?? '',
                  height: 220.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: hasPadding ? 20.0 : 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black,
                  child: Text(
                    _formatDuration(video.duration ?? ''),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChannelPage(channelId: video.channelId),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(video.author.profileImageUrl ?? ''),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          video.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 15.0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${video.author.username} • ${_formatViews(video.viewCount)} • ${timeago.format(video.timestamp)}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14.0),
                        ),
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
          )
        ],
      ),
    );
  }
}