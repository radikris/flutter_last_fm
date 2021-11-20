import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:last_fm_api/common/common_appbar.dart';
import 'package:last_fm_api/common/common_background.dart';
import 'package:last_fm_api/common/common_edittext.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = Get.find<SearchController>();
  final PagingController<int, Album> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
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
        child: Center(
          child: Column(
            children: [
              InkWell(onTap: Navigation.toDetail, child: Text("SEARCH")),
              CommonEditText(controller: controller.searchController),
              SizedBox(
                height: AppDimen.commonSizeVertical,
              ),
              PagedListView<int, Album>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Album>(
                  itemBuilder: (context, item, index) => Text(
                    item.artist ?? "",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
