import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/common/common_loading.dart';
import 'package:last_fm_api/screens/detail/components/detail_chapter.dart';
import 'package:last_fm_api/screens/detail/components/detail_info_chips.dart';
import 'package:last_fm_api/screens/detail/components/detail_playlist.dart';
import 'package:last_fm_api/screens/detail/components/detail_sliver_appbar.dart';
import 'package:last_fm_api/screens/detail/components/detail_summary.dart';
import 'package:last_fm_api/screens/detail/detail_controller.dart';
import 'package:last_fm_api/theme/app_color.dart';
import 'package:last_fm_api/theme/app_dimen.dart';
import 'package:last_fm_api/util/app_util.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: AppColor.backgroundGradient),
          child: Center(
            child: Obx(
              () => controller.isLoading.value
                  ? const CommonLoading()
                  : controller.albumdetail != null
                      ? NestedScrollView(
                          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                            return <Widget>[
                              DetailSliverAppBar(
                                  albumName: controller.albumdetail!.name ?? "",
                                  albumImage: controller.albumdetail!.image?.elementAt(3).text ?? ""),
                            ];
                          },
                          body: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimen.simpleSizeHorizontal, vertical: AppDimen.simpleSizeVertical),
                              child: Center(
                                child: Column(
                                  children: [
                                    DetailInfoChips(albumdetail: controller.albumdetail!),
                                    SizedBox(
                                      height: AppDimen.simpleSizeVertical,
                                    ),
                                    SizedBox(
                                      height: AppDimen.simpleSizeVertical,
                                    ),
                                    DetailChapter(chapter: 'playlist'.tr),
                                    DetailPlayList(tracks: controller.albumdetail!.tracks),
                                    SizedBox(
                                      height: AppDimen.smallSizeVertical,
                                    ),
                                    Text(
                                      AppUtil.publishFormat(controller.albumdetail!.wiki?.published ?? ""),
                                      style: themeData.textTheme.overline?.copyWith(fontSize: 14),
                                    ),
                                    DetailChapter(chapter: 'summary'.tr),
                                    DetailSummary(
                                      summary: controller.albumdetail!.wiki?.summary ?? "",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text('empty_album'.tr),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
