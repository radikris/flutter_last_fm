import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:last_fm_api/common/common_appbar.dart';
import 'package:last_fm_api/common/common_background.dart';
import 'package:last_fm_api/common/common_edittext.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/screens/search/components/album_card.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = Get.find<SearchController>();

  @override
  void initState() {
    controller.pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final apiResult = await controller.fetchAlbums(page: pageKey);
      final isLastPage = apiResult.length < controller.pageSize;
      if (isLastPage) {
        controller.pagingController.appendLastPage(apiResult);
      } else {
        final int nextPageKey = pageKey + (apiResult.length);
        controller.pagingController.appendPage(apiResult, nextPageKey);
      }
    } catch (error) {
      controller.pagingController.error = error;
    }
  }

  @override
  void dispose() {
    controller.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      appBar: CommonAppBar(title: 'app_title'.tr),
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppDimen.simpleSizeHorizontal, vertical: AppDimen.simpleSizeVertical),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: CommonEditText(
                          prefixIcon: const Icon(Icons.search),
                          hint: 'search_hint'.tr,
                          onChanged: controller.searchControllerOnChanged,
                          controller: controller.searchController)),
                  SizedBox(
                    height: AppDimen.commonSizeVertical,
                  ),
                  Container(
                    height: Get.size.height * 0.73,
                    child: RefreshIndicator(
                      onRefresh: () => Future.sync(
                        () => controller.pagingController.refresh(),
                      ),
                      child: PagedListView<int, Album>(
                        pagingController: controller.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Album>(
                          itemBuilder: (context, item, index) => GestureDetector(
                            onTap: () {
                              controller.saveSelectedAlbum(item);
                              Navigation.toDetail();
                            },
                            child: AlbumCard(
                              album: item,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
