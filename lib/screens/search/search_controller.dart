import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxString searchPhrase = ''.obs;

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
