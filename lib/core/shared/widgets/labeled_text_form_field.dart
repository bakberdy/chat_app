import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabeledTextFormField extends StatefulWidget {
  const LabeledTextFormField(
      {super.key,
      required this.themeData,
      this.hintText,
      required this.label,
      required this.controller,
      this.keyboardType,
      this.validator,
      this.inputFormatters,
      this.enabled = true});
  final bool enabled;
  final ThemeData themeData;
  final String? hintText;
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<LabeledTextFormField> createState() => _LabeledTextFormFieldState();
}

class _LabeledTextFormFieldState extends State<LabeledTextFormField> {
  final FocusNode _focusNode = FocusNode();

  bool _showClearButton = false;

  @override
  void initState() {
    widget.controller.addListener(_updateClearButton);
    _focusNode.addListener(_updateClearButton);

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _updateClearButton() {
    if (mounted) {
      Future.delayed(Duration.zero, () {
        setState(() {
          _showClearButton =
              widget.controller.text.isNotEmpty && _focusNode.hasFocus;
        });
      });
    }
  }

  final errorBorderSide = BorderSide(width: 2, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    var outlineInputBorder = OutlineInputBorder(borderSide: errorBorderSide);
    return Row(
      children: [
        SizedBox(
            width: 100,
            child: Text(
              widget.label,
              style: themeData.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            )),
        Expanded(
          child: TextFormField(
            enabled: widget.enabled,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: widget.inputFormatters,
            focusNode: _focusNode,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            style: themeData.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedErrorBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              errorStyle: TextStyle(height: 0, fontSize: 0),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: widget.hintText,
              suffixIcon: _showClearButton
                  ? IconButton(
                      icon: Icon(Icons.clear, size: 20),
                      onPressed: () {
                        widget.controller.clear();
                      },
                    )
                  : null,
              hintStyle: themeData.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500, color: themeData.canvasColor),
            ),
          ),
        )
      ],
    );
  }
}
