import 'package:base_structor/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  const LocaleText({Key key, @required this.text, this.style, this.textAlign = TextAlign.left}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.locale,
      textAlign: textAlign,
      style: style,
    );
  }
}
