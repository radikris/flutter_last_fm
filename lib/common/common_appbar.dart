import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/app_service.dart';
import 'package:last_fm_api/gen/assets.gen.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/theme/app_color.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class CommonAppBar extends StatelessWidget {
  CommonAppBar({Key? key, this.canGoBack = false, required this.title}) : super(key: key);

  final bool canGoBack;
  final String title;

  final appService = Get.find<AppService>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: canGoBack,
      backgroundColor: AppColor.primary500,
      title: Text(title, style: themeData.textTheme.headline4?.copyWith(color: AppColor.appWhite)),
      leading: canGoBack
          ? const InkWell(
              child: Icon(Icons.arrow_back_ios),
              onTap: Navigation.popBack,
            )
          : null,
      iconTheme: const IconThemeData(
        color: AppColor.appWhite, //change your color here
      ),
      actions: <Widget>[
        Obx(() => appService.isHungarian.value
            ? InkWell(onTap: appService.changeLanguage, child: Assets.language.hungaryLang.svg())
            : InkWell(onTap: appService.changeLanguage, child: Assets.language.englishLang.svg())),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDimen.largeRadius),
        ),
      ),
    );
  }
}
