// import 'package:flutter/material.dart';
// import 'package:tekne_sepeti_mobile/AppTheme.dart';
// import 'package:tekne_sepeti_mobile/core/config/size_config.dart';
// import 'package:tekne_sepeti_mobile/core/widgets/locale_text.dart';

// class LoadingService {
//   static loadingScreen({BuildContext context, bool isOpen, String message = "Yükleniyor..."}) {
//     if (isOpen) {
//       return showDialog(
//         useRootNavigator: false,
//         context: context,
//         builder: (context) {
//           ThemeData themeData = Theme.of(context);
//           return AlertDialog(
//             content: SizedBox(
//               height: MySize.size120,
//               width: MySize.size120,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 40,
//                     height: 40,
//                     child: CircularProgressIndicator(),
//                   ),
//                   SizedBox(
//                     height: MySize.size30,
//                   ),
//                   LocaleText(
//                     text: message,
//                     style: AppTheme.getTextStyle(themeData.textTheme.caption),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       Navigator.of(context).pop();
//     }
//   }
// }
