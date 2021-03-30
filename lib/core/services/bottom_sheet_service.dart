import 'package:flutter/material.dart';

class BottomSheetService {
  static customBottomSheet({
    BuildContext context,
    Widget content,
    double height,
  }) {
    ThemeData themeData = Theme.of(context);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return Container(
          height: height != null && height > 0 ? height : MediaQuery.of(context).size.height * 0.75,
          child: Center(
            child: content,
          ),
          decoration: BoxDecoration(
            color: themeData.colorScheme.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        );
      },
    );
  }
}
