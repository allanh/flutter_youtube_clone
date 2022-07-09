import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/models/videosList/video_models.dart';

import '../../data/remote/response/api_response.dart';
import '../../repository/movies/mock_video_repository.dart';
import '../../repository/movies/video_repository_impl.dart';

class VideoListViewModel extends ChangeNotifier {
  final _myRepo = VideoRepoImp();
  // 假資料
  //final _myRepo = MockVideoRepository();
  ApiResponse<VideoModels> videos = ApiResponse.loading();

  void _setVideos(ApiResponse<VideoModels> response) {
    debugPrint("$response");
    videos = response;
    notifyListeners();
  }

  // 取得影片
  Future<void> fetchMovies() async {
    _setVideos(ApiResponse.loading());
    _myRepo
        .getVideosList()
        .then((value) => _setVideos(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setVideos(ApiResponse.error(error.toString())));
  }
}
