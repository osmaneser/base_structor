import 'package:base_structor/core/init/locator.dart';
import 'package:flutter/material.dart';

import 'ui/modules/home/home_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}