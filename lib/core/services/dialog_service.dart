// import 'package:base_structor/core/constants/custom_enums.dart';
// import 'package:flutter/material.dart';
// import 'package:tekne_sepeti_mobile/core/config/size_config.dart';
// import 'package:tekne_sepeti_mobile/core/constants/custom-enums.dart';
// import 'package:tekne_sepeti_mobile/core/widgets/cp_button.dart';
// import 'package:tekne_sepeti_mobile/core/widgets/locale_text.dart';

// class DialogService {
//   static Future<void> confirmDialog(
//       {@required BuildContext context,
//       String title,
//       @required Widget content,
//       bool onlyCancelButton = false,
//       String confirmText,
//       String cancelText = "Kapat",
//       Function onTap}) {
//     return showDialog(
//       context: context,
//       useRootNavigator: false,
//       builder: (context) {
//         ThemeData themeData = Theme.of(context);
//         return AlertDialog(
//           title: title != null
//               ? LocaleText(
//                   text: title,
//                 )
//               : SizedBox(),
//           content: Container(child: content),
//           actions: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: CpButton(
//                       onTap: () => Navigator.pop(context),
//                       text: cancelText,
//                       color: themeData.colorScheme.secondary,
//                     ),
//                   ),
//                   SizedBox(
//                     width: MySize.size10,
//                   ),
//                   onlyCancelButton
//                       ? SizedBox()
//                       : Expanded(
//                           child: CpButton(
//                             onTap: onTap,
//                             text: confirmText,
//                             color: themeData.primaryColor,
//                           ),
//                         )
//                 ],
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }

//   static Future<void> alertDialog({
//     @required BuildContext context,
//     @required String message,
//     String confirmButtonText = "Tamam",
//     String cancelButtonText = "Kapat",
//     int duration,

//     ///
//     /// Kapat buttonu gösterir
//     /// Varsayılan true
//     ///
//     bool showCloseButton = true,
//     @required EnumAlertType type,
//     Function onConfirmTap,
//     Function onCloseTap,
//   }) async {
//     ThemeData themeData = Theme.of(context);
//     showDialog(
//       context: context,
//       useRootNavigator: false,
//       child: AlertDialog(
//         content: Container(
//           height: MediaQuery.of(context).size.height / 4,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _getIconByAlertType(type),
//                     SizedBox(
//                       height: MySize.size24,
//                     ),
//                     Text(
//                       message,
//                       style: themeData.textTheme.caption,
//                       textAlign: TextAlign.center,
//                     )
//                   ],
//                 ),
//               ),
//               !showCloseButton
//                   ? SizedBox()
//                   : Column(
//                       children: [
//                         SizedBox(
//                           height: MySize.size20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: CpButton(
//                                 onTap: () {
//                                   Navigator.pop(context);

//                                   if (onCloseTap != null) onCloseTap();

//                                 },
//                                 color: themeData.colorScheme.secondary,
//                                 text: cancelButtonText,
//                               ),
//                             ),
//                             type == EnumAlertType.Question
//                                 ? SizedBox(
//                                     width: MySize.size10,
//                                   )
//                                 : SizedBox(),
//                             type == EnumAlertType.Question
//                                 ? Expanded(
//                                     child: CpButton(
//                                       onTap: onConfirmTap != null ? onConfirmTap : (){},
//                                       text: confirmButtonText,
//                                       color: themeData.accentColor,
//                                     ),
//                                   )
//                                 : SizedBox()
//                           ],
//                         )
//                       ],
//                     )
//             ],
//           ),
//         ),
//       ),
//     );
//     if (!showCloseButton) {
//       await Future.delayed(Duration(milliseconds: duration));
//       Navigator.pop(context);
//     }
//   }

//   static _getIconByAlertType(EnumAlertType type) {
//     switch (type) {
//       case EnumAlertType.Error:
//         return Icon(
//           Icons.cancel,
//           color: Colors.redAccent,
//           size: MySize.size36,
//         );
//         break;

//       case EnumAlertType.Success:
//         return Icon(
//           Icons.check,
//           color: Colors.green,
//           size: MySize.size36,
//         );
//         break;

//       case EnumAlertType.Warning:
//         return Icon(
//           Icons.cancel,
//           color: Colors.orange,
//           size: MySize.size36,
//         );
//         break;

//       case EnumAlertType.Info:
//         return Icon(
//           Icons.cancel,
//           color: Colors.blueAccent,
//           size: MySize.size36,
//         );
//         break;

//       case EnumAlertType.Question:
//         return Icon(
//           Icons.help,
//           color: Colors.black,
//           size: MySize.size36,
//         );
//         break;
//       default:
//         return Icon(Icons.help);
//     }
//   }
// }
