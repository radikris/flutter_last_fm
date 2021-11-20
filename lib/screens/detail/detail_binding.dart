import 'package:get/get.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_impl.dart';
import 'package:last_fm_api/screens/detail/detail_controller.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    print("detail binding");

    Get.lazyPut<DetailController>(
      () => DetailController(mbid: Get.find<SearchController>().selectedAlbumId, repository: AlbumRepositoryImpl.to),
    );
  }
}
