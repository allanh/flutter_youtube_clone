// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModels _$VideoModelsFromJson(Map<String, dynamic> json) => VideoModels(
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoModelsToJson(VideoModels instance) =>
    <String, dynamic>{
      'videos': instance.videos,
    };

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      name: json['name'] as String?,
      thumbnail: json['thumbnail'] as String?,
      username: json['username'] as String?,
      title: json['title'] as String?,
      dayago: json['dayago'] as String?,
      viewcount: json['viewcount'] as String?,
      subscribeCount: json['subscribeCount'] as String?,
      likeCount: json['likeCount'] as String?,
      unlickCount: json['unlickCount'] as String?,
      videoUrl: json['videoUrl'],
      commentsCount: json['commentsCount'] as String?,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'username': instance.username,
      'title': instance.title,
      'dayago': instance.dayago,
      'viewcount': instance.viewcount,
      'subscribeCount': instance.subscribeCount,
      'likeCount': instance.likeCount,
      'unlickCount': instance.unlickCount,
      'commentsCount': instance.commentsCount,
      'videoUrl': instance.videoUrl,
    };
