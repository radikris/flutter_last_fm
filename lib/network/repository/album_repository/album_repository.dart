import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/network/result/api_result.dart';

abstract class AlbumRepository {
  Future<ApiResult<List<Album>>> fetchAlbums({int? page, int? limit, String? search});
}
