import 'package:flutter/material.dart';
import 'package:last_fm_api/common/common_card.dart';
import 'package:last_fm_api/models/tracks.dart';
import 'package:last_fm_api/screens/detail/components/detail_playlist_element.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class DetailPlayList extends StatelessWidget {
  const DetailPlayList({Key? key, required this.tracks}) : super(key: key);

  final Tracks? tracks;

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      margin: EdgeInsets.symmetric(horizontal: AppDimen.commonSizeHorizontal),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, idx) {
            final track = tracks?.track?.elementAt(idx);
            return CommonCard(
                child: DetailPlaylistElement(
              track: track,
            ));
          },
          separatorBuilder: (ctx, idx) {
            return const Divider();
          },
          itemCount: tracks?.track?.length ?? 0),
    );
  }
}
