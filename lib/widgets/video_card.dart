import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube/model/data.dart';
import 'package:youtube/screens/nav_screen.dart';
import 'package:miniplayer/miniplayer.dart';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedVideoProvider.notifier).state = video;

        print('selected video: ${video.title}');
        ref
            .read(miniPlayerControllerProvider.notifier)
            .state
            .animateToHeight(state: PanelState.MAX);
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
                    video.duration ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge !
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
                  onTap: () => print('Navigate to profile'),
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
                              .bodyLarge !
                              .copyWith(fontSize: 15.0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${video.author.username ?? ''} • ${video.viewCount ?? ''} views',
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
