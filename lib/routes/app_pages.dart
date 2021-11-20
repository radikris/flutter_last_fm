import 'package:get/get.dart';
import 'package:last_fm_api/screens/detail/detail_binding.dart';
import 'package:last_fm_api/screens/detail/detail_page.dart';
import 'package:last_fm_api/screens/search/search_binding.dart';
import 'package:last_fm_api/screens/search/search_page.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SEARCH;

  static final routes = [
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailPage(),
      binding: DetailBinding(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
