import 'package:base_structor/core/auth/auth_view_model.dart';
import 'package:base_structor/core/init/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/auth/sign_in.dart';
import 'core/auth/sign_in.dart';
import 'core/constants/utils.dart';
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
          return EasyLocalization(
          startLocale: Locale("tr", "TR"),
          fallbackLocale: Locale("en", "US"),
          supportedLocales: Utils.supportedLanguages,
          path: "assets/lang",
          child: MaterialApp(
            home: SignInPage(),
          ),
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
