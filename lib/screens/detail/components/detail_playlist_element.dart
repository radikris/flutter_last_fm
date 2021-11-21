import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/models/track.dart';
import 'package:last_fm_api/theme/app_dimen.dart';
import 'package:last_fm_api/util/app_util.dart';

class DetailPlaylistElement extends StatelessWidget {
  const DetailPlaylistElement({Key? key, this.track}) : super(key: key);

  final Track? track;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(onTap: () => AppUtil.launchURL(track?.url ?? ""), child: const Icon(Icons.play_circle)),
            SizedBox(width: AppDimen.smallSizeHorizontal),
            SizedBox(
              width: Get.size.width * 0.45,
              child: Text(
                track?.name ?? "",
                softWrap: true,
                style: themeData.textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Text(AppUtil.formatedTime(track?.duration ?? 0))
      ],
    );
  }
}
