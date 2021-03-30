import 'package:flutter/material.dart';

class OeCheckbox extends StatefulWidget {
  final Function(bool) onChange;
  final String title;
  final TextStyle style;
  final Color checkboxBorderColor;
  final MainAxisAlignment mainAxisAlignment;

  const OeCheckbox(
      {Key key,
      @required this.onChange,
      @required this.title,
      this.style,
      this.checkboxBorderColor,
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);
  @override
  _OeCheckboxState createState() => _OeCheckboxState();
}

class _OeCheckboxState extends State<OeCheckbox> {
  ThemeData themeData;
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: <Widget>[
        Container(
          width: 30,
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: widget.checkboxBorderColor != null ? widget.checkboxBorderColor : themeData.colorScheme.secondary,
            ),
            child: Checkbox(
              activeColor: themeData.colorScheme.primary,
              onChanged: (bool value) {
                setState(() {
                  _check = value;
                });
                widget.onChange(_check);
              },
              value: _check,
            ),
          ),
        ),
        InkWell(
            onTap: () {
              setState(() {
                _check = !_check;
                widget.onChange(_check);
              });
            },
            child: Container(
                child: Text(
              widget.title,
              style: widget.style != null ? widget.style : TextStyle(fontSize: 14, color: themeData.accentColor),
              overflow: TextOverflow.visible,
            )))
      ],
    );
  }
}
