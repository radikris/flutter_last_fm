import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/models/album.dart';
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
        "page": page,
        "limit": limit,
        "album": search,
        "method": "album.search",
      });
      List<Album> albumList = Albummatches.fromJson(response["results"]["albummatches"]).album;
      return ApiResult.success(data: albumList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<Album>>> fetchAlbumDetail({String? mbid}) {
    // TODO: implement fetchAlbumDetail
    throw UnimplementedError();
  }

  // @override
  // Future<ApiResult<Album>>> fetchAlbumDetail({String? mbid}) async {
  //   try {
  //     final response = await ApiClient.to.get("", queryParameters: {
  //       "mbid": mbid,
  //       "method": "album.getInfo",
  //     });
  //     List<Album> albumList = Albummatches.fromJson(response["results"]["albummatches"]).album;
  //     return ApiResult.success(data: albumList);
  //   } catch (e) {
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }
}
