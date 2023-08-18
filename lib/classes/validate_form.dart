import 'package:flutter/material.dart';

  class ValidateForm {
  bool validateAndSave(GlobalKey<FormState> form) {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      return true;
    }
    return false;
  }
}
