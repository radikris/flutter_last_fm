import 'package:get/get.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository.dart';

class DetailController extends GetxController {
  final String mbid;
  final AlbumRepository repository;
  DetailController({required this.repository, required this.mbid});
}
