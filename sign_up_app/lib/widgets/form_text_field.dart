import 'package:flutter/material.dart';
import 'package:sign_up_app/utils/color_constants.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final dynamic keyboardType;
  int maxLines;
  String labelText;
  bool required;
  int maxLength;

  TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.maxLines,
    this.required = false,
    this.labelText = "",
    this.maxLength = 30,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _required = false;
  bool _length = false;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
            counterText: "",
            errorText: _required
                ? 'Required'
                : _length
                    ? "Too Short"
                    : null,
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorConstants.kLabelTextColor,
            ),
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorConstants.secondary,
            ),
            focusColor: ColorConstants.secondary,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: ColorConstants.primary,
                  width: 2,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: ColorConstants.secondary,
                  width: 2,
                )),
          ),
          onChanged: (String value) {
            {
              setState(() {
                _required = value.isEmpty;
              });
            }
          },
          onFieldSubmitted: (String value) {
            {
              if (value.length < 3) {
                setState(() {
                  _length = true;
                });
              } else if (value.length > 3) {
                setState(() {
                  _length = false;
                });
              }
            }
          },
        ),
      );
}
