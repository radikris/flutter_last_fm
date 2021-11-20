import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository.dart';

class SearchController extends GetxController {
  final pageSize = 5;
  AlbumRepository repository;

  SearchController({required this.repository});

  TextEditingController searchController = TextEditingController();
  final PagingController<int, Album> pagingController = PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);

  RxString searchPhrase = ''.obs;
  RxList<Album> albums = <Album>[].obs;

  @override
  void onInit() {
    super.onInit();
    debounce(searchPhrase, _onSearchChanged, time: const Duration(milliseconds: 500));
  }

  Future<List<Album>> fetchAlbums({int? page}) async {
    final result = await repository.fetchAlbums(search: searchPhrase.value, page: page, limit: pageSize);
    return result.when(success: (success) {
      return success;
    }, failure: (failure) {
      print(failure);
      return [];
    });
  }

  void _onSearchChanged(String query) {
    fetchAlbums();
    pagingController.refresh();
  }

  void searchControllerOnChanged(String value) {
    searchPhrase.value = value;
  }
}
