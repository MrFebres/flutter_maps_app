import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    Key? key,
    Duration duration = const Duration(seconds: 2),
    String btnLabel = 'Ok',
    VoidCallback? onOk,
    required String message,
  }) : super(
          key: key,
          action: SnackBarAction(
              label: btnLabel,
              onPressed: () {
                if (onOk != null) {
                  onOk();
                }
              }),
          content: Text(message),
          duration: duration,
        );
}
