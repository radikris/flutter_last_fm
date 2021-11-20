import 'package:flutter/material.dart';
import 'package:last_fm_api/common/common_network_image.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/screens/search/components/album_card_description.dart';
import 'package:last_fm_api/screens/search/components/album_card_wrapper.dart';
import 'package:last_fm_api/theme/app_dimen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Stack(
      children: <Widget>[
        AlbumCardWrapper(
          child: Padding(
            padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            child: AlbumCardDescription(album: album),
          ),
        ),
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CommonNetworkImage(url: album.image?.elementAt(3).text ?? "")),
        ),
      ],
    );
  }
}
