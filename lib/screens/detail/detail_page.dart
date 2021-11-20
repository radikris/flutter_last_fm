import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/common/common_appbar.dart';
import 'package:last_fm_api/common/common_background.dart';
import 'package:last_fm_api/common/common_card.dart';
import 'package:last_fm_api/common/common_network_image.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/screens/detail/components/detail_chapter.dart';
import 'package:last_fm_api/screens/detail/components/detail_info_chips.dart';
import 'package:last_fm_api/screens/detail/components/detail_sliver_appbar.dart';
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
                  ? CircularProgressIndicator.adaptive()
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
                                    const DetailChapter(chapter: "Playlist"),
                                    CommonCard(
                                      margin: EdgeInsets.symmetric(horizontal: AppDimen.commonSizeHorizontal),
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          itemBuilder: (ctx, idx) {
                                            final track = controller.albumdetail!.tracks?.track?.elementAt(idx);

                                            return CommonCard(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                          onTap: () => AppUtil.launchURL(track?.url ?? ""),
                                                          child: const Icon(Icons.play_circle)),
                                                      SizedBox(width: AppDimen.smallSizeHorizontal),
                                                      Text(
                                                        track?.name ?? "",
                                                        style: themeData.textTheme.bodyText1
                                                            ?.copyWith(fontWeight: FontWeight.bold),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(AppUtil.formatedTime(track?.duration ?? 0))
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (ctx, idx) {
                                            return Divider();
                                          },
                                          itemCount: controller.albumdetail!.tracks?.track?.length ?? 0),
                                    ),
                                    SizedBox(
                                      height: AppDimen.smallSizeVertical,
                                    ),
                                    Text(
                                      AppUtil.publishFormat(controller.albumdetail!.wiki?.published ?? ""),
                                      style: themeData.textTheme.overline?.copyWith(fontSize: 14),
                                    ),
                                    DetailChapter(chapter: "Summary"),
                                    Html(
                                      data: controller.albumdetail!.wiki?.summary ?? "",
                                      onLinkTap: (url, _, __, ___) {
                                        AppUtil.launchURL(url ?? "");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text("No album detail found:("),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
