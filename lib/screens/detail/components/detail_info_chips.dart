import 'package:flutter/material.dart';
import 'package:last_fm_api/common/common_card.dart';
import 'package:last_fm_api/models/albumdetail.dart';
import 'package:last_fm_api/util/app_util.dart';

class DetailInfoChips extends StatelessWidget {
  const DetailInfoChips({Key? key, required this.albumdetail}) : super(key: key);

  final Albumdetail albumdetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CommonCard(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.people), Text(AppUtil.formatStringToNumber(albumdetail.playcount))],
          ),
        ),
        CommonCard(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.headphones), Text(AppUtil.formatStringToNumber(albumdetail.listeners))],
          ),
        ),
        CommonCard(child: Text(albumdetail.artist)),
      ],
    );
  }
}
