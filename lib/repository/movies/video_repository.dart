import '../../models/videosList/video_models.dart';

abstract class VideoRepository {
  Future<VideoModels?> getVideosList();
}
