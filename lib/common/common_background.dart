import 'package:flutter/material.dart';
import 'package:last_fm_api/theme/app_color.dart';

class CommonBackground extends StatelessWidget {
  const CommonBackground({Key? key, required this.child, this.appBar}) : super(key: key);

  final Widget child;
  final Widget? appBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColor.primary200, AppColor.primary50]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          if (appBar != null) appBar!,
          child,
        ]),
      ),
    );
  }
}
