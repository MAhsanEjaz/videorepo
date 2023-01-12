import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void customSnackBar(BuildContext context, String? text) {
  showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: text!,
      ));
}

void customSuccessSnackBar(BuildContext context, String? text) {
  showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: text!,
      ));
}
