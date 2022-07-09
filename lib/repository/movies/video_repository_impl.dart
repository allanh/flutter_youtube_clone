import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/models/videosList/video_models.dart';

import '../../data/remote/network/api_end_points.dart';
import '../../data/remote/network/base_api_service.dart';
import '../../data/remote/network/network_api_service.dart';
import 'video_repository.dart';

class VideoRepoImp implements VideoRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<VideoModels?> getVideosList() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getVideos);
      debugPrint("$response");
      final jsonData = VideoModels.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}
