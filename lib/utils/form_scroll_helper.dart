import 'package:flutter/material.dart';

class FormScrollHelper {
  /// Scroll to first invalid field in a form
  static void scrollToFirstInvalidField(
    GlobalKey<FormState> formKey,
    List<GlobalKey> fieldKeys,
  ) {
    final formState = formKey.currentState;
    if (formState == null) return;

    // Trigger validation (so error messages show)
    formState.validate();

    for (final key in fieldKeys) {
      final ctx = key.currentContext;
      if (ctx != null) {
        final widget = ctx.widget;
        if (widget is TextFormField) {
          final validator = widget.validator;
          final controller = widget.controller;
          final value = controller?.text ?? "";

          if (validator != null && validator(value) != null) {
            Scrollable.ensureVisible(
              ctx,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            break; // Stop after first invalid field
          }
        }
      }
    }
  }
}
