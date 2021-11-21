import 'package:flavor/flavor.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/app_service.dart';
import 'package:last_fm_api/network/api_client.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_impl.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_mock.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppService>(() => AppService());
    Get.lazyPut<ApiClient>(() => ApiClient());
    if (Flavor.I.isDevelopment) {
      Get.lazyPut<AlbumRepositoryImpl>(() => AlbumRepositoryImpl());
    } else {
      Get.lazyPut<AlbumRepositoryMock>(() => AlbumRepositoryMock());
    }
  }
}
