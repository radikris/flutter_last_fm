import 'package:get/get.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_impl.dart';
import 'package:last_fm_api/screens/detail/detail_controller.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    print("detail binding");

    //TODO first only saved mbid, but API not everywhere had it
    Get.lazyPut<DetailController>(
      () => DetailController(album: Get.find<SearchController>().selectedAlbum, repository: AlbumRepositoryImpl.to),
    );
  }
}
