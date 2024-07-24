import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomDialog {
  static void showLoader() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      indicator: const SpinKitThreeInOut(
        color: Colors.blue,
        size: 50.0,
      ),
    );
  }
  static void dismissLoader(){
    EasyLoading.dismiss();
  }
}
