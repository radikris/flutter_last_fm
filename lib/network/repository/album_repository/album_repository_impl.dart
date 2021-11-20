import 'package:get/get.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/models/albumdetail.dart';
import 'package:last_fm_api/models/albummatches.dart';
import 'package:last_fm_api/network/api_client.dart';
import 'package:last_fm_api/network/exception/network_exceptions.dart';
import 'package:last_fm_api/network/result/api_result.dart';

import 'album_repository.dart';

class AlbumRepositoryImpl extends GetxService implements AlbumRepository {
  static AlbumRepositoryImpl get to => Get.find<AlbumRepositoryImpl>();

  @override
  Future<ApiResult<List<Album>>> fetchAlbums({int? page, int? limit, String? search}) async {
    try {
      final response = await ApiClient.to.get("", queryParameters: {
        "method": "album.search",
        "page": page,
        "limit": limit,
        "album": search,
      });
      List<Album> albumList = Albummatches.fromJson(response["results"]["albummatches"]).album;
      return ApiResult.success(data: albumList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Albumdetail>> fetchAlbumDetail({String? mbid, String? album, String? artist}) async {
    try {
      final response = await ApiClient.to.get("",
          queryParameters: {"method": "album.getInfo", "mbid": mbid, "artist": artist, "album": album, "lang": "hu"});
      Albumdetail albumDetail = Albumdetail.fromJson(response["album"]);
      print(albumDetail);
      return ApiResult.success(data: albumDetail);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
