import 'package:get/get.dart';
import 'package:primeiroapp/controllers/user.dart';

class UserBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}