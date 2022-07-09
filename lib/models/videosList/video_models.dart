import 'package:json_annotation/json_annotation.dart';
part 'video_models.g.dart';

List menus = [
  " All ",
  "Flutter",
  "Flutter Development",
  "Android",
];

@JsonSerializable()
class VideoModels {
  List<VideoModel>? videos;

  VideoModels({this.videos});

  factory VideoModels.fromJson(Map<String, dynamic> json) =>
      _$VideoModelsFromJson(json);
  Map<String, dynamic> toJson() => _$VideoModelsToJson(this);
}

@JsonSerializable()
class VideoModel {
  final String? name,
      thumbnail,
      username,
      title,
      dayago,
      viewcount,
      subscribeCount,
      likeCount,
      unlickCount,
      commentsCount;
  final videoUrl;

  VideoModel({
    this.name,
    this.thumbnail,
    this.username,
    this.title,
    this.dayago,
    this.viewcount,
    this.subscribeCount,
    this.likeCount,
    this.unlickCount,
    this.videoUrl,
    this.commentsCount,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
/*
{"videos": [{"name": "Flutter",
      "thumbnail": "https://img.youtube.com/vi/4AoFA19gbLo/sddefault.jpg",
      "username": "Flutter",
      "title": "Welcome to Flutter",
      "dayago": "1 years ago",
      "viewcount": "272K",
      "likeCount": "8.8k",
      "subscribeCount": "405k",
      "unlickCount": "0",
      "videoUrl": "https://www.youtube.com/watch?v=4AoFA19gbLo",
      "commentsCount": "48k"},
{      "name": "Flutter",
      "thumbnail": "https://img.youtube.com/vi/xWV71C2kp38/sddefault.jpg",
      "username": "Flutter",
      "title": "How do I make my first Flutter app",
      "dayago": "1 years ago",
      "viewcount": "151k",
      "likeCount": "4k",
      "subscribeCount": "405k",
      "unlickCount": "0",
      "videoUrl": "https://www.youtube.com/watch?v=xWV71C2kp38",
      "commentsCount": "48k"},
{
"name": "Flutter",
      "thumbnail": "https://img.youtube.com/vi/Z6KZ3cTGBWw/sddefault.jpg",
      "username": "Flutter",
      "title": "Building your first Flutter app",
      "dayago": "1 years ago",
      "viewcount": "285k",
      "likeCount": "2.4k",
      "subscribeCount": "405k",
      "unlickCount": "1k",
      "videoUrl": "https://www.youtube.com/watch?v=Z6KZ3cTGBWw",
      "commentsCount": "49k"
},
{
      "name": "Flutter",
      "thumbnail": "https://img.youtube.com/vi/QlwiL_yLh6E/sddefault.jpg",
      "username": "Flutter",
      "title": "What is State?",
      "dayago": "3 weeks ago",
      "viewcount": "51k",
      "likeCount": "1.3k",
      "subscribeCount": "405k",
      "unlickCount": "1k",
      "videoUrl": "https://www.youtube.com/watch?v=QlwiL_yLh6E",
      "commentsCount": "44.5k"
},
{
"name": "Flutter",
      "thumbnail": "https://img.youtube.com/vi/YY-_yrZdjGc/sddefault.jpg",
      "username": "Flutter",
      "title": "Building scrolling experiences in Flutter",
      "dayago": "5 days ago",
      "viewcount": "80k",
      "likeCount": "1.5k",
      "subscribeCount": "405k",
      "unlickCount": "0",
      "videoUrl": "https://www.youtube.com/watch?v=YY-_yrZdjGc",
      "commentsCount": "45.5k"
},
{
"name": "Flutter",
      "thumbnail": "https://img.youtube.com/vi/QIW35-vcA2o/sddefault.jpg",
      "username": "Flutter",
      "title": "Introducing Decoding Flutter",
      "dayago": "1 years ago",
      "viewcount": "47k",
      "likeCount": "11k",
      "subscribeCount": "405k",
      "unlickCount": "0",
      "videoUrl": "https://www.youtube.com/watch?v=QIW35-vcA2o",
      "commentsCount": "46.5k"

}]}*/