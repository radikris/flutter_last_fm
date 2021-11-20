import 'package:dio/dio.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/models/albummatches.dart';
import 'package:last_fm_api/network/dio_client.dart';
import 'package:last_fm_api/network/exception/network_exceptions.dart';
import 'package:last_fm_api/network/result/api_result.dart';

class APIRepository {
  late DioClient dioClient;
  final String _apiKey = "8dd4bab2643a71f57da6fe2fd466825b";
  String _baseUrl = "http://ws.audioscrobbler.com/2.0/";

  APIRepository() {
    var dio = Dio();

    dioClient = DioClient(_baseUrl, dio);
  }

  Future<ApiResult<List<Album>>> fetchAlbums(int page, int limit) async {
    try {
      final response = await dioClient.get("", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "limit": limit,
        "album": "Alma",
        "method": "album.search",
        "format": "json"
      });
      List<Album> albumList = Albummatches.fromJson(response["results"]["albummatches"]).album;
      return ApiResult.success(data: albumList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
