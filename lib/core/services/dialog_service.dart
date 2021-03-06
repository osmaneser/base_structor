import 'package:base_structor/core/constants/custom_enums.dart';
import 'package:base_structor/core/widgets/locale_text.dart';
import 'package:base_structor/core/widgets/oe_button.dart';
import 'package:flutter/material.dart';
class DialogService {
  static Future<void> confirmDialog(
      {@required BuildContext context,
      String title,
      @required Widget content,
      bool onlyCancelButton = false,
      String confirmText,
      String cancelText = "Kapat",
      Function onTap}) {
    return showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) {
        ThemeData themeData = Theme.of(context);
        return AlertDialog(
          title: title != null
              ? LocaleText(
                  text: title,
                )
              : SizedBox(),
          content: Container(child: content),
          actions: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OeButton(
                      onTap: () => Navigator.pop(context),
                      text: cancelText,
                      color: themeData.colorScheme.secondary,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  onlyCancelButton
                      ? SizedBox()
                      : Expanded(
                          child: OeButton(
                            onTap: onTap,
                            text: confirmText,
                            color: themeData.primaryColor,
                          ),
                        )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static Future<void> alertDialog({
    @required BuildContext context,
    @required String message,
    String confirmButtonText = "Tamam",
    String cancelButtonText = "Kapat",
    int duration,

    ///
    /// Kapat buttonu g??sterir
    /// Varsay??lan true
    ///
    bool showCloseButton = true,
    @required EnumAlertType type,
    Function onConfirmTap,
    Function onCloseTap,
  }) async {
    ThemeData themeData = Theme.of(context);
    showDialog(
      context: context,
      useRootNavigator: false,
      child: AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getIconByAlertType(type),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      message,
                      style: themeData.textTheme.caption,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              !showCloseButton
                  ? SizedBox()
                  : Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OeButton(
                                onTap: () {
                                  Navigator.pop(context);

                                  if (onCloseTap != null) onCloseTap();

                                },
                                color: themeData.colorScheme.secondary,
                                text: cancelButtonText,
                              ),
                            ),
                            type == EnumAlertType.Question
                                ? SizedBox(
                                    width: 10,
                                  )
                                : SizedBox(),
                            type == EnumAlertType.Question
                                ? Expanded(
                                    child: OeButton(
                                      onTap: onConfirmTap != null ? onConfirmTap : (){},
                                      text: confirmButtonText,
                                      color: themeData.accentColor,
                                    ),
                                  )
                                : SizedBox()
                          ],
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
    if (!showCloseButton) {
      await Future.delayed(Duration(milliseconds: duration));
      Navigator.pop(context);
    }
  }

  static _getColorByAlertType(EnumAlertType type){
    switch (type) {
      case EnumAlertType.Error:
        return Colors.red;
        break;
      case EnumAlertType.Warning:
        return Colors.orange;
        break;
      
      case EnumAlertType.Info:
        return Colors.blue;
        break;
      
      case EnumAlertType.Success:
        return Colors.green;
        break;
      
      case EnumAlertType.Question:
        return Colors.grey;
        break;
      default:
    }
  }

  static _getIconByAlertType(EnumAlertType type) {
    switch (type) {
      case EnumAlertType.Error:
        return Icon(
          Icons.cancel,
          color: Colors.red,
          size: 36,
        );
        break;

      case EnumAlertType.Success:
        return Icon(
          Icons.check,
          color: Colors.green,
          size: 36,
        );
        break;

      case EnumAlertType.Warning:
        return Icon(
          Icons.cancel,
          color: Colors.orange,
          size: 36,
        );
        break;

      case EnumAlertType.Info:
        return Icon(
          Icons.cancel,
          color: Colors.blue,
          size: 36,
        );
        break;

      case EnumAlertType.Question:
        return Icon(
          Icons.help,
          color: Colors.grey,
          size: 36,
        );
        break;
      default:
        return Icon(Icons.help);
    }
  }
}
