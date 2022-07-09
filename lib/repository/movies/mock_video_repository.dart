import '../../models/videosList/video_models.dart';
import 'video_repository.dart';

class MockVideoRepository implements VideoRepository {
  @override
  Future<VideoModels?> getVideosList() async {
    return VideoModels(videos: _dummyData);
  }

  final List<VideoModel> _dummyData = [
    VideoModel(
      name: "Flutter",
      thumbnail: "https://img.youtube.com/vi/4AoFA19gbLo/sddefault.jpg",
      username: "Flutter",
      title: "Welcome to Flutter",
      dayago: "1 years ago",
      viewcount: "272K",
      likeCount: "8.8k",
      subscribeCount: "405k",
      unlickCount: "0",
      videoUrl: "https://www.youtube.com/watch?v=4AoFA19gbLo",
      commentsCount: "48k",
    ),
    VideoModel(
      name: "Flutter",
      thumbnail: "https://img.youtube.com/vi/xWV71C2kp38/sddefault.jpg",
      username: "Flutter",
      title: "How do I make my first Flutter app",
      dayago: "1 years ago",
      viewcount: "151k",
      likeCount: "4k",
      subscribeCount: "405k",
      unlickCount: "0",
      videoUrl: "https://www.youtube.com/watch?v=xWV71C2kp38",
      commentsCount: "48k",
    ),
    VideoModel(
      name: "Flutter",
      thumbnail: "https://img.youtube.com/vi/Z6KZ3cTGBWw/sddefault.jpg",
      username: "Flutter",
      title: "Building your first Flutter app",
      dayago: "1 years ago",
      viewcount: "285k",
      likeCount: "2.4k",
      subscribeCount: "405k",
      unlickCount: "1k",
      videoUrl: "https://www.youtube.com/watch?v=Z6KZ3cTGBWw",
      commentsCount: "49k",
    ),
    VideoModel(
      name: "Flutter",
      thumbnail: "https://img.youtube.com/vi/QlwiL_yLh6E/sddefault.jpg",
      username: "Flutter",
      title: "What is State?",
      dayago: "3 weeks ago",
      viewcount: "51k",
      likeCount: "1.3k",
      subscribeCount: "405k",
      unlickCount: "1k",
      videoUrl: "https://www.youtube.com/watch?v=QlwiL_yLh6E",
      commentsCount: "44.5k",
    ),
    VideoModel(
      name: "Flutter",
      thumbnail: "https://img.youtube.com/vi/YY-_yrZdjGc/sddefault.jpg",
      username: "Flutter",
      title: "Building scrolling experiences in Flutter",
      dayago: "5 days ago",
      viewcount: "80k",
      likeCount: "1.5k",
      subscribeCount: "405k",
      unlickCount: "0",
      videoUrl: "https://www.youtube.com/watch?v=YY-_yrZdjGc",
      commentsCount: "45.5k",
    ),
    VideoModel(
      name: "Flutter",
      thumbnail: "https://img.youtube.com/vi/QIW35-vcA2o/sddefault.jpg",
      username: "Flutter",
      title: "Introducing Decoding Flutter",
      dayago: "1 years ago",
      viewcount: "47k",
      likeCount: "11k",
      subscribeCount: "405k",
      unlickCount: "0",
      videoUrl: "https://www.youtube.com/watch?v=QIW35-vcA2o",
      commentsCount: "46.5k",
    ),
  ];
}
