import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfc/config/colors.dart';
import 'package:tfc/generated/locale_keys.g.dart';

enum DialogType {
  success,
  error,
  info,
}

extension DialogDetail on DialogType {
  String get title {
    switch (this) {
      case DialogType.success:
        return LocaleKeys.common_dialog_success_title.tr();
      case DialogType.error:
        return LocaleKeys.common_dialog_error_title.tr();
      case DialogType.info:
        return LocaleKeys.common_dialog_info_title.tr();
    }
  }

  String get actionString {
    switch (this) {
      case DialogType.success:
        return LocaleKeys.common_dialog_success_action.tr();
      case DialogType.error:
        return LocaleKeys.common_dialog_error_action.tr();
      case DialogType.info:
        return LocaleKeys.common_dialog_info_action.tr();
    }
  }

  Color get primaryColor {
    switch (this) {
      case DialogType.success:
        return AppColors.success;
      case DialogType.error:
        return AppColors.error;
      case DialogType.info:
        return AppColors.info;
    }
  }

  Color get primaryColorText {
    switch (this) {
      case DialogType.success:
        return AppColors.successText;
      case DialogType.error:
        return AppColors.errorText;
      case DialogType.info:
        return AppColors.infoText;
    }
  }

  IconData get displayIcon {
    switch (this) {
      case DialogType.success:
        return Icons.check;
      case DialogType.error:
        return Icons.priority_high;
      case DialogType.info:
        return Icons.question_mark;
    }
  }

  Color get iconColor {
    switch (this) {
      case DialogType.success:
        return AppColors.neutral.shade50;
      case DialogType.error:
        return AppColors.neutral.shade50;
      case DialogType.info:
        return AppColors.neutral.shade800;
    }
  }
}
