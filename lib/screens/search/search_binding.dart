import 'package:get/get.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    print("search binding");
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
