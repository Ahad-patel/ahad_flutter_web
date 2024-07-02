import 'package:flutter/material.dart';

/// [ValidationHelpers] is an abstract class for manage validation
/// of the whole application
abstract class ValidationHelpers {
  /// Check value is Empty OR Not
  static String? emptyCheck(String? value, String errorMessage) {
    if (value!.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  /// Check name field
  static String? userNameField(String? value) {
    if (value!.trim().isEmpty) {
      return 'user name required';
    }
    if (value.trim().length < 3) {
      return 'user name length must be more than 3 characters';
    }
    return null;
  }

  /// Check value is More than 8 Characters
  static String? passwordCheckValidate(String? value) {
    RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$');
    if (value!.trim().isEmpty) {
      return 'password is required';
    } else if (value.trim().length < 8) {
      return 'password must be at least than 8 characters long';
    }
    return null;
  }

  /// Check value is More than 8 Characters
  static String? confirmPasswordValidate(String? value, passwordValue) {
    if (value != passwordValue) {
      return 'password does not match';
    }
    return null;
  }
}
