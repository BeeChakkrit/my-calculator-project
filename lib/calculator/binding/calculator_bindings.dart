import 'package:flutter_calculator_app/calculator/controllers/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculatorController());
  }
}
