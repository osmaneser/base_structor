import 'package:base_structor/core/auth/auth_view_model.dart';
import 'package:base_structor/core/init/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/auth/sign_in.dart';
import 'core/auth/sign_in.dart';
import 'ui/modules/home/home_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        builder: (context, child) {
          return MaterialApp(
            home: SignInPage(),
          );
        },
        providers: [
          ChangeNotifierProvider<AuthViewModel>(
            create: (context) => AuthViewModel(),
            child: SignInPage(),
          )
        ]);
    ;
  }
}
