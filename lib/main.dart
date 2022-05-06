import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/calculator/binding/calculator_bindings.dart';
import 'package:flutter_calculator_app/calculator/views/calculator_view.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => CalculatorView(),
          binding: CalculatorBinding(),
        ),
      ],
    );
  }
}
