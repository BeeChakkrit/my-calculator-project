import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calculator_app/calculator/controllers/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorView extends GetView<CalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        title: Center(
            child: Text(
          'เครื่องคิดเลข',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        elevation: 1,
      ),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[buildAnswerWidget(), buildNumPadWidget()],
      )),
    );
  }

  Widget buildAnswerWidget() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Obx(
                () => Text(
                  '${controller.inputFull} ${controller.operator} ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Obx(
                () => Text(
                  '${controller.answer}',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumPadWidget() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(children: <Widget>[
              buildNumberButton("CE", numberButton: false, onTap: () {
                controller.clearAnswer();
              }),
              buildNumberButton("C", numberButton: false, onTap: () {
                controller.clearAll();
              }),
              buildNumberButton("⌫", numberButton: false, onTap: () {
                controller.removeAnswerLast();
              }),
              buildNumberButton("÷", numberButton: false, onTap: () {
                controller.addOperatorToAnswer("÷");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("7", onTap: () {
                controller.addNumberToAnswer(7);
              }),
              buildNumberButton("8", onTap: () {
                controller.addNumberToAnswer(8);
              }),
              buildNumberButton("9", onTap: () {
                controller.addNumberToAnswer(9);
              }),
              buildNumberButton("×", numberButton: false, onTap: () {
                controller.addOperatorToAnswer("×");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("4", onTap: () {
                controller.addNumberToAnswer(4);
              }),
              buildNumberButton("5", onTap: () {
                controller.addNumberToAnswer(5);
              }),
              buildNumberButton("6", onTap: () {
                controller.addNumberToAnswer(6);
              }),
              buildNumberButton("−", numberButton: false, onTap: () {
                controller.addOperatorToAnswer("-");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("1", onTap: () {
                controller.addNumberToAnswer(1);
              }),
              buildNumberButton("2", onTap: () {
                controller.addNumberToAnswer(2);
              }),
              buildNumberButton("3", onTap: () {
                controller.addNumberToAnswer(3);
              }),
              buildNumberButton("+", numberButton: false, onTap: () {
                controller.addOperatorToAnswer("+");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("±", numberButton: false, onTap: () {
                controller.toggleNegative();
              }),
              buildNumberButton("0", onTap: () {
                controller.addNumberToAnswer(0);
              }),
              buildNumberButton(".", numberButton: false, onTap: () {
                controller.addDotToAnswer();
              }),
              buildNumberButton("=", numberButton: false, onTap: () {
                controller.calculate();
              }),
            ]),
          ],
        ));
  }

  Widget buildNumberButton(String str,
      {Function() onTap, bool numberButton = true}) {
    Widget widget;
    if (numberButton) {
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.indigo.shade100,
              child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.blue,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str,
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold)))))));
    } else {
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.indigo.shade200,
              child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.blue,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str, style: TextStyle(fontSize: 28)))))));
    }

    return Expanded(child: widget);
  }
}
