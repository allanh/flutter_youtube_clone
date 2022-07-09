import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/videosList/video_models.dart';
import '../../../../extension/list_extension.dart';
import 'video_detail_screen.dart';

class VideoTiles extends StatefulWidget {
  const VideoTiles({Key? key, required this.list}) : super(key: key);

  final List<VideoModel> list;
  @override
  State createState() => _VideoTilesState();
}

class _VideoTilesState extends State<VideoTiles> {
  @override
  Widget build(BuildContext context) {
    return _getVideosListView(widget.list);
  }

  Widget _getVideosListView(List<VideoModel>? videosList) {
    return Column(children: [
      ListView.builder(
          itemCount: videosList?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, position) {
            return videosList?.tryGet(position) != null
                ? _getVideoListItem(videosList![position])
                : Container();
          })
    ]);
  }

  Widget _getVideoListItem(VideoModel item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // 進入影片詳細頁
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoDetailScreen(
                    thumbnail: item.thumbnail,
                    commentsCount: item.commentsCount,
                    daysAgo: item.dayago,
                    likeCount: item.likeCount,
                    profileImg: item.thumbnail,
                    subscribeCount: item.subscribeCount,
                    title: item.title,
                    unlikeCount: item.unlickCount,
                    username: item.username,
                    videoUrl: item.videoUrl,
                    viewCount: item.viewcount,
                    otherList: widget.list,
                  ),
                ),
              );
            },
            // 影片縮圖
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(item.thumbnail!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // 影片資訊
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 上傳者圖像
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(item.thumbnail!),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 影片標題
                    Text(
                      item.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // 上傳者名稱與觀看次數
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            "${item.username ?? ''} - ${item.viewcount ?? '0'}",
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
