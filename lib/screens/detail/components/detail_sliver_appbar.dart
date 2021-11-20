import 'package:flutter/material.dart';
import 'package:last_fm_api/common/common_network_image.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/theme/app_color.dart';

class DetailSliverAppBar extends StatelessWidget {
  const DetailSliverAppBar({Key? key, required this.albumName, required this.albumImage}) : super(key: key);

  final String albumName;
  final String albumImage;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: AppColor.appWhite, //change your color here
      ),
      leading: const InkWell(
        child: Icon(Icons.arrow_back_ios),
        onTap: Navigation.popBack,
      ),
      expandedHeight: 220.0,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(albumName, style: themeData.textTheme.headline4?.copyWith(color: AppColor.appWhite)),
        background: CommonNetworkImage(url: albumImage),
      ),
    );
  }
}
