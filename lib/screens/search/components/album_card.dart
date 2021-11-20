import 'package:flutter/material.dart';
import 'package:last_fm_api/models/album.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          height: 170.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: <BoxShadow>[BoxShadow(color: Colors.black54, blurRadius: 5.0, offset: Offset(0.0, 0.75))],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  album.name ?? "",
                  style: themeData.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 10.0),
                Text(
                  '${album.artist}',
                  style: themeData.textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 110.0,
              image: NetworkImage(
                album.image?.elementAt(3).text ?? "",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
