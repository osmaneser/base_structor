import 'package:base_structor/core/constants/global_constants.dart';
import 'package:base_structor/core/widgets/locale_text.dart';
import 'package:flutter/material.dart';

class LoadingService {
  static loadingScreen({bool isOpen, String message = "Lütfen bekleyiniz..."}) {
    if (isOpen) {
      return showDialog(
        useRootNavigator: false,
        context: GlobalConstant.navigatorKey.currentContext,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 120,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LocaleText(
                    text: message,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      GlobalConstant.navigatorKey.currentState.maybePop();
    }
  }
}
