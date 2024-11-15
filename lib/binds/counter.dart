import 'package:get/get.dart';
import 'package:primeiroapp/controllers/counter.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}