import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/models/album.dart';

class SearchController extends GetxController {
  final pageSize = 3;

  TextEditingController searchController = TextEditingController();
  RxString searchPhrase = ''.obs;
  RxList<Album> albums = <Album>[].obs;

  @override
  void onInit() {
    super.onInit();
    debounce(searchPhrase, _onSearchChanged);
  }

  Future<void> fetchSearch() async {}

  void _onSearchChanged(String query) {
    fetchSearch();
  }
}
