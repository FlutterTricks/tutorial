import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField(
      {super.key,
      super.controller,
      super.initialValue,
      super.focusNode,
      super.decoration,
      super.keyboardType,
      super.textCapitalization,
      super.enabled,
      super.readOnly,
      super.onTap,
      super.autofocus,
      super.textInputAction,
      super.onChanged,
      super.maxLines,
      super.minLines,
      super.maxLength,
      super.onFieldSubmitted,
      super.style,
      super.validator,
      super.inputFormatters})
      : super(onTapOutside: _onTapOutside);

  // ignore: prefer_function_declarations_over_variables
  static final void Function(PointerDownEvent) _onTapOutside = (value) {
    FocusManager.instance.primaryFocus?.unfocus();
  };
}
