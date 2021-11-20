import 'package:flutter/material.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class DetailChapter extends StatelessWidget {
  const DetailChapter({Key? key, required this.chapter}) : super(key: key);

  final String chapter;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppDimen.smallSizeVertical),
        Text(
          chapter,
          style: themeData.textTheme.headline6,
        ),
        SizedBox(height: AppDimen.smallSizeVertical),
      ],
    );
  }
}
