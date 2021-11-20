import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/common/common_appbar.dart';
import 'package:last_fm_api/common/common_background.dart';
import 'package:last_fm_api/common/common_network_image.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/screens/detail/detail_controller.dart';
import 'package:last_fm_api/theme/app_color.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

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
                        SliverAppBar(
                          iconTheme: IconThemeData(
                            color: AppColor.appWhite, //change your color here
                          ),
                          leading: const InkWell(
                            child: Icon(Icons.arrow_back_ios),
                            onTap: Navigation.popBack,
                          ),
                          expandedHeight: 220.0,
                          pinned: true,
                          floating: true,
                          flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              title: Text(controller.albumdetail.name,
                                  style: themeData.textTheme.headline4?.copyWith(color: AppColor.appWhite)),
                              background:
                                  CommonNetworkImage(url: controller.albumdetail.image.elementAt(3).text ?? "")),
                        ),
                      ];
                    },
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimen.simpleSizeHorizontal, vertical: AppDimen.simpleSizeVertical),
                        child: Center(
                          child: Text(
                            controller.albumdetail.wiki.content,
                            overflow: TextOverflow.fade,
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
