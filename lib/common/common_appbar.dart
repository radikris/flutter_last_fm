import 'package:flutter/material.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/theme/app_color.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({Key? key, this.canGoBack = false, required this.title}) : super(key: key);

  final bool canGoBack;
  final String title;
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
      iconTheme: IconThemeData(
        color: AppColor.appWhite, //change your color here
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDimen.largeRadius),
        ),
      ),
    );
  }
}
