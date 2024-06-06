import 'package:toktik_app/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getVideoPostsByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(String search);
}
