import 'package:flutter/material.dart';
import 'package:last_fm_api/common/common_card.dart';
import 'package:last_fm_api/models/tracks.dart';
import 'package:last_fm_api/theme/app_dimen.dart';
import 'package:last_fm_api/util/app_util.dart';

class DetailPlayList extends StatelessWidget {
  const DetailPlayList({Key? key, required this.tracks}) : super(key: key);

  final Tracks? tracks;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return CommonCard(
      margin: EdgeInsets.symmetric(horizontal: AppDimen.commonSizeHorizontal),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx, idx) {
            final track = tracks?.track?.elementAt(idx);

            return CommonCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(onTap: () => AppUtil.launchURL(track?.url ?? ""), child: const Icon(Icons.play_circle)),
                      SizedBox(width: AppDimen.smallSizeHorizontal),
                      Text(
                        track?.name ?? "",
                        style: themeData.textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
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
          itemCount: tracks?.track?.length ?? 0),
    );
  }
}
