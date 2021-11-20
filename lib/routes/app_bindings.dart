import 'package:get/get.dart';
import 'package:last_fm_api/network/api_client.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_impl.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_mock.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<AlbumRepositoryImpl>(() => AlbumRepositoryImpl());
    Get.lazyPut<AlbumRepositoryMock>(() => AlbumRepositoryMock());
  }
}
