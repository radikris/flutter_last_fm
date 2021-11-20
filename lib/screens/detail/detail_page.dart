import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/common/common_appbar.dart';
import 'package:last_fm_api/common/common_background.dart';
import 'package:last_fm_api/routes/app_navigator.dart';
import 'package:last_fm_api/screens/detail/detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      appBar: CommonAppBar(
        title: 'detail_name',
        canGoBack: true,
      ),
      child: Center(
        child: Column(
          children: [
            Text("Alma"),
            Text("Alma"),
            Text("Alma"),
            Text("Alma"),
            Text("Alma"),
          ],
        ),
      ),
    );
  }
}
