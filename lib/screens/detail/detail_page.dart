import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/common/common_appbar.dart';
import 'package:last_fm_api/common/common_background.dart';
import 'package:last_fm_api/common/common_card.dart';
import 'package:last_fm_api/common/common_network_image.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
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
      body: Container(
        decoration: BoxDecoration(gradient: AppColor.backgroundGradient),
        child: Center(
          child: Obx(
            () => controller.isLoading.value
                ? CircularProgressIndicator.adaptive()
                : NestedScrollView(
                    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        DetailSliverAppBar(
                            albumName: controller.albumdetail.name,
                            albumImage: controller.albumdetail.image.elementAt(3).text ?? ""),
                      ];
                    },
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimen.simpleSizeHorizontal, vertical: AppDimen.simpleSizeVertical),
                        child: Center(
                          child: Column(
                            children: [
                              DetailInfoChips(albumdetail: controller.albumdetail),
                              SizedBox(
                                height: AppDimen.simpleSizeVertical,
                              ),
                              SizedBox(
                                height: AppDimen.simpleSizeVertical,
                              ),
                              Text(
                                controller.albumdetail.wiki.summary,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
