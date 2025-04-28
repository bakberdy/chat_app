import 'package:flutter/cupertino.dart';
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
      this.inputFormatters});

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
    setState(() {
      _showClearButton =
          widget.controller.text.isNotEmpty && _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 100,
            child: Text(
              widget.label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
            )),
        Expanded(
          child: TextFormField(
            
            inputFormatters: widget.inputFormatters,
            focusNode: _focusNode,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            style: TextStyle(
                height: 1.2,
                color: widget.themeData.canvasColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.red)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.red)),
                errorStyle:
                    TextStyle(color: Colors.red, height: 0, fontSize: 0),
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
                hintStyle: TextStyle(
                    color: widget.themeData.canvasColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis)),
          ),
        )
      ],
    );
  }
}
