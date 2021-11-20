import 'package:get/get.dart';
import 'package:last_fm_api/models/index.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository.dart';

class DetailController extends GetxController {
  final String mbid;
  final AlbumRepository repository;
  DetailController({required this.repository, required this.mbid});

  late Albumdetail albumdetail;

  final isLoading = true.obs;

  @override
  void onReady() async {
    super.onReady();

    final apiResult = await repository.fetchAlbumDetail(mbid: mbid);
    apiResult.when(success: (success) {
      albumdetail = success;
      isLoading.value = false;
    }, failure: (failure) {
      isLoading.value = false;
    });
  }
}
