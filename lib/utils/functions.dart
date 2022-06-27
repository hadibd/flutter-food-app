import 'package:flutter/material.dart';
import 'package:food_app/widgets/colors.dart';

class Functions {
  static showSnackbar(context, content) {
    var scaffold = ScaffoldMessenger.of(context);

    scaffold.showSnackBar(SnackBar(
        backgroundColor: AppColor.widgetColor,
        action: SnackBarAction(
          label: 'X',
          onPressed: () => scaffold.hideCurrentSnackBar(),
        ),
        content: Text(content)));
  }
}
