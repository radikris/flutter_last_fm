import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:last_fm_api/common/common_appbar.dart';
import 'package:last_fm_api/common/common_background.dart';
import 'package:last_fm_api/common/common_edittext.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/network/exception/network_exceptions.dart';
import 'package:last_fm_api/network/repository/album_repository/album_repository_impl.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key) {
    print("searchpage init");
  }

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //final controller = Get.find<SearchController>();
  final PagingController<int, Album> _pagingController = PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);
  APIRepository api = APIRepository();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    print("fetch next page");
    print(pageKey);

    try {
      final apiResult = await api.fetchAlbums(pageKey, 5);
      List<Album> newItems = [];

      apiResult.when(success: (List<Album> result) {
        newItems = result;

        final isLastPage = newItems.length < 5;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final int nextPageKey = pageKey + (newItems.length);
          _pagingController.appendPage(newItems, nextPageKey);
        }
      }, failure: (NetworkExceptions exception) {
        print(exception);
      });
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      appBar: CommonAppBar(title: 'app_title'.tr),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimen.simpleSizeHorizontal, vertical: AppDimen.simpleSizeVertical),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(onTap: Navigation.toDetail, child: Text("SEARCH")),
                //CommonEditText(controller: controller.searchController),
                SizedBox(
                  height: AppDimen.commonSizeVertical,
                ),
                Container(
                  height: Get.size.height * 0.5,
                  child: RefreshIndicator(
                    onRefresh: () => Future.sync(
                      () => _pagingController.refresh(),
                    ),
                    child: PagedListView<int, Album>(
                      //physics: BouncingScrollPhysics(),

                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Album>(
                        itemBuilder: (context, item, index) => Container(
                          height: 50,
                          child: Text(
                            item.artist ?? "",
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
    );
  }
}
