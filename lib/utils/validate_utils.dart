// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:tfc/generated/locale_keys.g.dart';

// enum ValidateType {
//   email,
//   password,
//   phone,
// }

// abstract class ValidatorUtils {
//   static const String errorEmpty = LocaleKeys.value_not_empty;
//   static const String errorRange = LocaleKeys.value_not_valid_range;
//   static const String errorEmail = LocaleKeys.value_not_valid_email;
//   static const String errorPhone = LocaleKeys.value_not_valid_phone;
//   static const String errorPassword = LocaleKeys.value_not_valid_password;
//   static const String errorId = LocaleKeys.value_not_valid_id;

//   static validate(
//     String data, {
//     required BuildContext context,
//     required ValidateType type,
//     int? min,
//     int? max,
//     bool allowEmpty = false,
//   }) {
//     ///Empty
//     if (!allowEmpty && data.isEmpty) {
//       return tr(errorEmpty);
//     }

//     switch (type) {
//       case ValidateType.email:

//         ///Email pattern
//         final RegExp emailRegex = RegExp(
//             r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
//         if (!emailRegex.hasMatch(data)) {
//           return tr(errorEmail);
//         }
//         return null;
//       case ValidateType.phone:

//         ///Phone pattern
//         final RegExp phoneRegex = RegExp(r'^[0-9]*$');
//         if (!phoneRegex.hasMatch(data)) {
//           return tr(errorPhone);
//         }
//         return null;

//       default:
//         return null;
//     }
//   }
// }
