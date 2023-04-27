import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_up_app/utils/color_constants.dart';

class MobileTextField extends StatefulWidget {
  final TextEditingController contoller;

  const MobileTextField({
    Key? key,
    required this.contoller,
  }) : super(key: key);

  @override
  State<MobileTextField> createState() => _MobileTextFieldState();
}

class _MobileTextFieldState extends State<MobileTextField> {
  bool _validate = false;
  bool _length = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.contoller,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          counterText: '',
          errorText: _validate
              ? 'Required'
              : _length
                  ? "Can't be less than 10 Digits"
                  : null,
          focusColor: ColorConstants.secondary,
          prefixText: "+91",
          hintText: "Enter Mobile No.",
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ColorConstants.kLabelTextColor,
          ),
          labelText: "Mobile No.",
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorConstants.secondary,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(
                color: ColorConstants.primary,
                width: 2,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(
                color: ColorConstants.primary,
                width: 2,
              )),
        ),
        onChanged: (String value) {
          {
            setState(() {
              _validate = value.isEmpty;
            });
          }
        },
        onFieldSubmitted: (String value) {
          {
            if (value.length != 10) {
              setState(() {
                _length = true;
              });
            } 
            else if (value.length == 10) {
              setState(() {
                _length = false;
              });
            }
          }
        },
      ),
    );
  }
}
