import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    disableCapture();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  disableCapture() async
  {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
}
