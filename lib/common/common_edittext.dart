import 'package:flutter/material.dart';
import 'package:last_fm_api/theme/app_color.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class CommonEditText extends StatelessWidget {
  const CommonEditText({
    Key? key,
    required this.controller,
    this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.prefixTap,
    this.suffixTap,
    this.hint,
    this.textInputType,
    this.isEnabled,
    this.isSecret,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  final String? title;
  final String? hint;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function? prefixTap;
  final Function? suffixTap;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final bool? isEnabled;
  final bool? isSecret;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) Text(title!, style: themeData.textTheme.subtitle2!.copyWith(color: AppColor.grey600)),
        if (title != null)
          SizedBox(
            height: AppDimen.smallSizeVertical,
          ),
        TextFormField(
          controller: controller,
          validator: validator,
          enabled: isEnabled,
          onChanged: onChanged,
          keyboardType: textInputType,
          obscureText: isSecret ?? false,
          decoration: InputDecoration(
            errorText: (errorText != null && errorText!.trim().isNotEmpty) ? errorText : null,
            hintText: hint,
            suffixIcon: suffixIcon != null ? InkWell(onTap: () => suffixTap?.call(), child: suffixIcon) : null,
            prefixIcon: prefixIcon != null ? InkWell(onTap: () => prefixTap?.call(), child: prefixIcon) : null,
          ),
        ),
      ],
    );
  }
}
