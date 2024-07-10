import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      decoration: InputDecoration(
          label: label != null ? Text(label!) : null,
          hintText: hint,
          isDense: true,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(
              color: colors.primary,
            ),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(
              color: colors.error,
            ),
          ),
          errorText: errorMessage,
          errorBorder: border),
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
    );
  }
}
