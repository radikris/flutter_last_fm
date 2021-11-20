import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:last_fm_api/util/app_util.dart';

class DetailSummary extends StatelessWidget {
  const DetailSummary({Key? key, required this.summary}) : super(key: key);

  final String summary;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: summary,
      onLinkTap: (url, _, __, ___) {
        AppUtil.launchURL(url ?? "");
      },
    );
  }
}
