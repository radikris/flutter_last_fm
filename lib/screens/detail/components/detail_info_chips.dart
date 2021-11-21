import 'package:flutter/material.dart';
import 'package:last_fm_api/common/common_card.dart';
import 'package:last_fm_api/models/albumdetail.dart';
import 'package:last_fm_api/util/app_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailInfoChips extends StatelessWidget {
  const DetailInfoChips({Key? key, required this.albumdetail}) : super(key: key);

  final Albumdetail albumdetail;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 5.0,
      runAlignment: WrapAlignment.spaceEvenly,
      runSpacing: 5.0,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        CommonCard(
          height: 40.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [const Icon(Icons.people), Text(AppUtil.formatStringToNumber(albumdetail.playcount ?? "0"))],
          ),
        ),
        CommonCard(
          height: 40.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [const Icon(Icons.headphones), Text(AppUtil.formatStringToNumber(albumdetail.listeners ?? "0"))],
          ),
        ),
        CommonCard(
            height: 40.h,
            child: Text(
              albumdetail.artist ?? "",
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }
}
