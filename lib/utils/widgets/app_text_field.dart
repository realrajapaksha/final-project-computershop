import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_colors.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool isEmpty;
  final TextInputType type;
  final TextInputAction action;
  final bool obscureText;
  final bool isLargeText;
  final int minLines;
  final int? maxLines;
  final bool isRequired;
  final bool enable;
  final TextAlign align;
  final ValueSetter<bool> onValueChanged;
  final ValueChanged<String>? onChangedText;

  const AppTextField(
      {Key? key,
      required this.labelText,
      this.controller,
      this.isEmpty = false,
      this.type = TextInputType.text,
      this.action = TextInputAction.done,
      this.obscureText = false,
      this.isLargeText = false,
      this.minLines = 1,
      this.maxLines,
      this.isRequired = true,
      this.enable = true,
      this.align = TextAlign.start,
      required this.onValueChanged,
      this.onChangedText})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppMainTextFieldState();
}

class _AppMainTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    Color setColor() {
      if (widget.isEmpty) {
        return AppColors.red;
      } else {
        return AppColors.deepBlue;
      }
    }

    return TextField(
      controller: widget.controller,
      keyboardType: widget.type,
      textInputAction: widget.action,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      enabled: widget.enable,
      textAlign: widget.align,
      style: TextStyle(
        color: setColor(),
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: setColor()),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: setColor()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: setColor()),
        ),
        // border: const OutlineInputBorder(),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: setColor()),
      ),
      obscureText: widget.obscureText,
      onChanged: (String value) {
        if (widget.isRequired) {
          final isEmpty = value.trim().isEmpty ? true : false;
          widget.onValueChanged(isEmpty);
        }

        final ValueChanged<String>? onSubmitted = widget.onChangedText;
        if (onSubmitted == null) {
          return;
        }

        onSubmitted(value);
      },
      onSubmitted: (String value) {
        if (widget.isRequired) {
          final isEmpty = value.trim().isEmpty == '' ? true : false;
          widget.onValueChanged(isEmpty);
        }
      },
      inputFormatters: widget.type ==
              const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              )
          ? [
              FilteringTextInputFormatter.allow(
                RegExp(r'^(\d+)?\.?\d{0,2}'),
              ),
            ]
          : [],
    );
  }
}
