import 'dart:developer';

import 'package:get/get.dart';

class CalculatorController extends GetxController {
  // String answer;
  // String answerTemp;
  // String inputFull;
  // String operator;
  // bool calculateMode;
  var answer = "0".obs;
  var operator = "".obs;
  var answerTemp = "".obs;
  var inputFull = "".obs;
  var calculateMode = false.obs;

  @override
  Future<void> onInit() async {
    // answer = "0";
    // operator = "";
    // answerTemp = "";
    // inputFull = "";
    // calculateMode = false;
    super.onInit();
  }

  void toggleNegative() {
    if (answer.contains("-")) {
      answer.value = answer.replaceAll("-", "");
    } else {
      answer.value = "-" + answer.value;
    }
  }

  void clearAnswer() {
    answer.value = '0';
  }

  void clearAll() {
    answer.value = "0";
    inputFull.value = "";
    calculateMode.value = false;
    operator.value = "";
  }

  void calculate() {
    print(answer.value);
    if (calculateMode.value) {
      bool decimalMode = false;
      double value = 0;
      if (answer.contains(".") || answerTemp.contains(".")) {
        decimalMode = true;
      }

      if (operator.value == "+") {
        value = (double.parse(answerTemp.value) + double.parse(answer.value));
      } else if (operator.value == "-") {
        value = (double.parse(answerTemp.value) - double.parse(answer.value));
      } else if (operator.value == "×") {
        value = (double.parse(answerTemp.value) * double.parse(answer.value));
      } else if (operator.value == "÷") {
        value = (double.parse(answerTemp.value) / double.parse(answer.value));
      }

      if (!decimalMode) {
        answer.value = value.toInt().toString();
      } else {
        answer.value = value.toString();
      }

      calculateMode.value = false;
      operator.value = "";
      answerTemp.value = "";
      inputFull.value = "";
    }
  }

  void addOperatorToAnswer(String op) {
    if (answer.value != "0" && !calculateMode.value) {
      calculateMode.value = true;
      answerTemp.value = answer.value;
      inputFull.value += operator.value + " " + answerTemp.value;
      operator.value = op;
      answer.value = "0";
    } else if (calculateMode.value) {
      if (answer.isNotEmpty) {
        calculate();
        answerTemp = answer;
        inputFull.value = "";
        operator.value = "";
      } else {
        operator.value = op;
      }
    }
  }

  void addDotToAnswer() {
    if (!answer.contains(".")) {
      answer.value = answer + ".";
    }
  }

  void addNumberToAnswer(int number) {
    if (number == 0 && answer == "0") {
      // Not do anything.
    } else if (number != 0 && answer == "0") {
      answer.value = number.toString();
    } else {
      answer.value += number.toString();
    }
  }

  void removeAnswerLast() {
    if (answer == "0") {
      // Not do anything.
    } else {
      if (answer.value.length > 1) {
        answer.value = answer.substring(0, answer.value.length - 1);
        if (answer.value.length == 1 && (answer == "." || answer == "-")) {
          answer.value = "0";
        }
      } else {
        answer.value = "0";
      }
    }
  }
}
