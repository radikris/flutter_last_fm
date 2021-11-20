import 'package:flutter/material.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({Key? key, required this.child, this.padding, this.margin}) : super(key: key);

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding ??
            EdgeInsets.symmetric(horizontal: AppDimen.commonSizeHorizontal, vertical: AppDimen.smallSizeVertical),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimen.mediumRadius),
          boxShadow: const <BoxShadow>[BoxShadow(color: Colors.black54, blurRadius: 5.0, offset: Offset(0.0, 0.75))],
        ),
        child: child);
  }
}
