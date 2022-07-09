import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/videosList/video_models.dart';
import 'video_tiles.dart';

class VideoDetailScreen extends StatefulWidget {
  final String? thumbnail,
      title,
      viewCount,
      daysAgo,
      username,
      profileImg,
      subscribeCount,
      likeCount,
      unlikeCount,
      videoUrl,
      commentsCount;
  final List<VideoModel>? otherList;

  const VideoDetailScreen(
      {Key? key,
      this.thumbnail,
      this.title,
      this.viewCount,
      this.daysAgo,
      this.username,
      this.profileImg,
      this.subscribeCount,
      this.likeCount,
      this.unlikeCount,
      this.videoUrl,
      this.commentsCount,
      this.otherList})
      : super(key: key);

  @override
  State createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late YoutubePlayerController _playerController;

  void runYoutubePlayer() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl ?? '');
    if (videoId != null) {
      _playerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: true,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    runYoutubePlayer();
  }

  @override
  void deactivate() {
    _playerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerController,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: const Color(0xFF282828),
          body: SafeArea(
            child: Column(
              children: [
                player,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: Column(
                            children: [
                              _buildTitle(),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "${widget.viewCount ?? '0'} views ${widget.daysAgo ?? '0'}",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 12,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              _buildButtons(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(color: Colors.grey.withOpacity(0.3)),
                        // 訂閱
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.thumbnail != null)
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              widget.thumbnail!)),
                                ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.username ?? '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${widget.subscribeCount ?? '0'}subscribers",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 12,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, top: 12),
                                child: Column(
                                  children: const [
                                    Text(
                                      "SUBSCRIBE",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Divider(color: Colors.grey.withOpacity(0.3)),
                        const SizedBox(height: 10),
                        // 留言
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Comments",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        widget.commentsCount ?? '0',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.unfold_more,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                padding: const EdgeInsets.only(top: 12),
                                child: Row(
                                  children: [
                                    if (widget.thumbnail != null)
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.3),
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                widget.thumbnail!),
                                      ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "This is comment section.",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey.withOpacity(0.3)),
                        VideoTiles(
                          list: widget.otherList ?? [],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 影片標題
  Widget _buildTitle() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 80,
            child: Text(
              widget.title ?? '',
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 30,
          ),
        ],
      );

  /// 按鈕列
  Widget _buildButtons() => Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 喜歡人數
            Column(
              children: [
                const Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Colors.white,
                ),
                const SizedBox(height: 2),
                Text(
                  widget.likeCount ?? '0',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            // 不喜歡人數
            Column(
              children: [
                const Icon(
                  Icons.thumb_down_alt_outlined,
                  color: Colors.white,
                ),
                const SizedBox(height: 2),
                Text(
                  widget.unlikeCount ?? '0',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            // 分享
            Column(
              children: const [
                Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
                SizedBox(height: 2),
                Text(
                  "Share",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            // 下載
            Column(
              children: const [
                Icon(
                  Icons.vertical_align_bottom_outlined,
                  color: Colors.white,
                ),
                SizedBox(height: 2),
                Text(
                  "Download",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            // 儲存
            Column(
              children: const [
                Icon(
                  Icons.add_to_photos_outlined,
                  color: Colors.white,
                ),
                SizedBox(height: 2),
                Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
