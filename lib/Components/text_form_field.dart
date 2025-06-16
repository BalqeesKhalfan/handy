import 'package:flutter/material.dart';
import 'package:homecleaning/Theme/app_theme.dart';


class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.label = '',
    this.hint = '',
    this.isLabeled = true,
    this.isView = false,
    this.showErrors = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.validator, // extra custom rules
    this.required = false,
    this.minLength,
    this.maxLength,
    this.addIcon = false
  });

  /// data
  final TextEditingController controller;

  /// appearance / behaviour
  final String label;
  final String hint;
  final bool isLabeled;
  final bool isView;
  final bool showErrors;
  final bool addIcon;

  /// validation helpers
  final bool required;
  final int? minLength;
  final int? maxLength;
  final FormFieldValidator<String>? validator;

  /// text-field specific
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _touched = false;
  String? _errorText;

  /// Combines built-in rules with any caller-supplied validator
  String? _runValidators(String? value) {
    final v = value ?? '';
    if (widget.required && v.isEmpty) {
      return 'Please enter a ${widget.label.isEmpty ? 'value' : widget.label}';
    }
    if (widget.minLength != null && v.length < widget.minLength!) {
      return '${widget.label} must be at least ${widget.minLength} characters';
    }
    if (widget.maxLength != null && v.length > widget.maxLength!) {
      return '${widget.label} must be at most ${widget.maxLength} characters';
    }
    // delegate to extra user rules
    if (widget.validator != null) return widget.validator!(v);
    return null;
  }

  void _handleChanged(String _) {
    setState(() {
      _touched = true;
      _errorText = _runValidators(widget.controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ――― View-mode ───────────────────────────────────────────────
    if (widget.isView) {
      final value = widget.controller.text.trim();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          value.isEmpty ? '-' : value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    // ――― Edit-mode ───────────────────────────────────────────────
    _errorText = _runValidators(widget.controller.text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isLabeled && widget.label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          autovalidateMode: AutovalidateMode.disabled, // manual
          decoration: InputDecoration(
            hintText: widget.hint.isEmpty ? widget.label : widget.hint,
            suffixIcon:widget.addIcon?null: widget.suffixIcon,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: widget.showErrors && _touched ? _errorText : null,
          ),
          onChanged: _handleChanged,
          onTap: () => setState(() => _touched = true),
        ),

        if (widget.showErrors && _touched && _errorText == null)
          const SizedBox(height: 24),
      ],
    );
  }
}
