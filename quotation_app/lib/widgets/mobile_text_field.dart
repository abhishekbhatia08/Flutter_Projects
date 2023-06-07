import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController contoller;

  const MobileTextField({
    Key? key,
    required this.hintText,
    required this.contoller,
  }) : super(key: key);

  @override
  State<MobileTextField> createState() => _MobileTextFieldState();
}

class _MobileTextFieldState extends State<MobileTextField> {
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Mobile Number';
        } else if (value.length != 10) {
          return 'Please check your entered Mobile Number';
        }
        return null;
      },
      controller: widget.contoller,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
          counterText: '',
          errorText: _validate ? 'Required' : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black)),
      onChanged: (String value) {
        {
          setState(() {
            _validate = value.isEmpty;
          });
        }
      },
    );
  }
}
