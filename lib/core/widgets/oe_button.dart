import 'package:base_structor/core/constants/custom_enums.dart';
import 'package:flutter/material.dart';

import 'locale_text.dart';

class OeButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final EnumButtonType buttonType;
  final Color color;
  final Color textColor;
  final bool isDisabled;
  final double customHeight;
  final bool hasBorder;

  const OeButton({
    Key key,
    @required this.onTap,
    @required this.text,
    this.buttonType,
    this.color,
    this.textColor,
    this.isDisabled = false,
    this.customHeight, this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      height: customHeight != null ? customHeight : themeData.buttonTheme.height,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        color: color != null ? color : themeData.primaryColor,
        splashColor: Colors.white,
        onPressed: isDisabled ? null : onTap,
        hoverColor: themeData.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        child: LocaleText(
          text: text,
          style: textColor != null ? TextStyle(color: textColor) : themeData.textTheme.button,
        ),
      ),
      decoration: BoxDecoration(
        border: hasBorder ? Border.all(style: BorderStyle.solid, color: themeData.primaryColor) : Border(),
      ),
    );
  }
}
