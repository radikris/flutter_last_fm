import 'package:flutter/material.dart';
import 'package:last_fm_api/models/album.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class AlbumCardDescription extends StatelessWidget {
  const AlbumCardDescription({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          album.name ?? "",
          style: themeData.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(height: AppDimen.commonSizeVertical),
        Text(
          album.artist ?? "",
          style: themeData.textTheme.headline6,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
