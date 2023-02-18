import 'package:get/get.dart';
import '../view/main_view.dart';
import 'controller.dart';

class SplashController extends GetxController {
  var controller = Get.put(Controller());
  @override
  void onReady() {
    Future.delayed(
      const Duration(milliseconds: 2790),
      () {
        controller.isChange.value = true;
      },
    );
    Future.delayed(
      const Duration(milliseconds: 5500),
      () {
        Get.offAll(const MainView());
      },
    );
    super.onReady();
  }
}
