import 'package:base_structor/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'locale_text.dart';

class OeTextFormField extends StatelessWidget {
  final String hintText;
  final bool showHintText;
  final TextStyle style;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final String labelText;
  final bool showLabelText;
  final bool isPrefixIcon;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isObsecure;
  final Function validator;
  final bool autoFocus;
  final bool isDisable;
  final TextInputType keyboardType;
  final AutovalidateMode autoValidateMode;
  final bool isMargingBottom;
  final Function onTap;
  final Color fillColor;

  OeTextFormField({
    this.hintText,
    this.labelText,
    this.isPrefixIcon = false,
    this.prefixIcon = Icons.ac_unit_sharp,
    this.controller,
    this.isObsecure = false,
    this.validator,
    this.autoFocus = false,
    this.isDisable = false,
    this.keyboardType,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.isMargingBottom = true,
    this.onTap,
    this.fillColor,
    this.hintStyle,
    this.labelStyle,
    this.style,
    this.showHintText = true,
    this.showLabelText = true,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showLabelText
              ? LocaleText(
                  text: labelText,
                  style: labelStyle != null
                      ? labelStyle
                      : TextStyle(color: themeData.accentColor, fontSize: 14),
                )
              : SizedBox(),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: isMargingBottom ? EdgeInsets.only(bottom: 10) : null,
            child: TextFormField(
              onTap: onTap,
              autofocus: autoFocus,
              enabled: !isDisable,
              keyboardType: keyboardType,
              autovalidateMode: autoValidateMode,
              obscureText: isObsecure,
              maxLines: isObsecure ? 1 : 3,
              minLines: TextInputType.multiline == keyboardType ? 3 : 1,
              validator: validator,
              style: style != null ? style : themeData.textTheme.bodyText2,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                fillColor: fillColor ?? fillColor,
                filled: true,
                hintText: showHintText ? hintText.locale : '',
                hintStyle: hintStyle != null
                    ? hintStyle
                    : TextStyle(
                        color: themeData.accentColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                prefixIcon: isPrefixIcon
                    ? Icon(
                        prefixIcon,
                        color:
                            themeData.colorScheme.background.withOpacity(0.7),
                      )
                    : null,
              ),
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
        ],
      ),
    );
  }
}
