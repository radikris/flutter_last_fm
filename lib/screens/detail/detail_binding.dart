import 'package:flavor/flavor.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_impl.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_mock.dart';
import 'package:last_fm_api/screens/detail/detail_controller.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    //TODO first only saved mbid, but API not everywhere had it
    AlbumRepository repository;
    if (Flavor.I.isDevelopment) {
      repository = AlbumRepositoryImpl.to;
    } else {
      repository = AlbumRepositoryMock.to;
    }
    Get.lazyPut<DetailController>(
      () => DetailController(album: Get.find<SearchController>().selectedAlbum, repository: repository),
    );
  }
}
