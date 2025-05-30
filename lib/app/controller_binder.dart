import 'package:get/get.dart';

import '../features/auth/ui/controllers/auth_controller.dart';
import '../features/home/ui/controllers/place_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(PlaceController());

  }
}