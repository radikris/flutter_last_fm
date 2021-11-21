import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:last_fm_api/theme/app_dimen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumCardWrapper extends StatelessWidget {
  const AlbumCardWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(AppDimen.mediumSizeHorizontal * 2, AppDimen.smallestSizeVertical,
            AppDimen.commonSizeHorizontal, AppDimen.smallestSizeVertical),
        height: 170.0.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimen.mediumRadius),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black54, blurRadius: AppDimen.smallestRadius, offset: const Offset(0.0, 0.75))
          ],
        ),
        child: child);
  }
}
