import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_fm_api/common/common_network_image.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/screens/search/components/album_card_description.dart';
import 'package:last_fm_api/screens/search/components/album_card_wrapper.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AlbumCardWrapper(
          child: Padding(
            padding: EdgeInsets.fromLTRB(100.0.w, 20.0.h, 20.0.h, 20.0.w),
            child: AlbumCardDescription(album: album),
          ),
        ),
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimen.commonRadius),
              child: CommonNetworkImage(width: 110.w, url: album.image?.elementAt(3).text ?? "")),
        ),
      ],
    );
  }
}
