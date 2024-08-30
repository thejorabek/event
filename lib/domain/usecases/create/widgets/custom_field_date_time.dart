import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';

class CustomFieldDateTime extends StatefulWidget {
  const CustomFieldDateTime({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final void Function() onPressed;
  final TextEditingController controller;

  @override
  State<CustomFieldDateTime> createState() => _CustomFieldDateTimeState();
}

class _CustomFieldDateTimeState extends State<CustomFieldDateTime> {
  String oldText = "";

  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: 11,
      onChanged: (text) {
        if (oldText.length < text.length) {
          var isNumber = RegExp(r"[0-9]");
          if (!isNumber.hasMatch(text.substring(text.length - 1))) {
            widget.controller.text = text.substring(0, text.length - 1);
          }
          var regex = RegExp(r"([0-9]{2})");
          var regex2 = RegExp(r"([0-9]{2}):([0-9]{2})");
          var regex3 = RegExp(r"([0-9]{2}):([0-9]{2})/([0-9]{2})");
          var regex4 = RegExp(r"([0-9]{2}):([0-9]{2})/([0-9]{2}):([0-9]{2})");
          if (regex.hasMatch(text) && text.length == 2) {
            widget.controller.text = "$text:";
            widget.controller.selection = const TextSelection(baseOffset: 3, extentOffset: 3);
          }
          if (regex2.hasMatch(text) && text.length == 5) {
            widget.controller.text = "$text/";
            widget.controller.selection = const TextSelection(baseOffset: 6, extentOffset: 6);
          }
          if (regex3.hasMatch(text) && text.length == 8) {
            widget.controller.text = "$text:";
            widget.controller.selection = const TextSelection(baseOffset: 9, extentOffset: 9);
          }
          if (regex4.hasMatch(text) && text.length == 11) {
            enabled = false;
            setState(() {});
          }
        } else {
          setState(() {
            enabled = true;
          });
        }
        oldText = text;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey100,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: enabled
              ? const SizedBox.shrink()
              : const Icon(
                  Icons.check,
                  color: Colors.green,
                )),
    );
  }
}
