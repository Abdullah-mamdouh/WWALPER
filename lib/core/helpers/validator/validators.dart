import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wwalper_app/core/helpers/validator/app_regs.dart';
import 'package:wwalper_app/core/utils/app_strings.dart';

FormFieldValidator<String>? emailValidator() {
  validator(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailEmpty;
    } else if (!AppRegex.isEmailValid(value)) {
      return AppStrings.validEmail;
    }
    return null;
  }

  return validator;
}

FormFieldValidator<String>? passwordValidator() {
  validator(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordEmpty;
    }
    if (value.length < 8) {
      return AppStrings.validPassword;
    } else {
      return null;
    }
  }

  return validator;
}

FormFieldValidator<String>? confirmPassword(
    {required TextEditingController ctrl}) {
  validator(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyConfirmPass;
    }
    if (value != ctrl.text) {
      return AppStrings.validConfirmPass;
    }
    return null;
  }

  return validator;
}

FormFieldValidator<String>? fullNameValidator() {
  validator(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyFullName;
    }
    return null;
  }

  return validator;
}


