import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';

class CustomDropButton extends StatefulWidget {
  const CustomDropButton({
    super.key,
    required this.colors,
    required this.onChange,
  });

  final void Function(int color) onChange;
  final List<int> colors;

  @override
  State<CustomDropButton> createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  late int selectedItem;

  @override
  void initState() {
    selectedItem = widget.colors[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<int>(
        isExpanded: true,
        value: selectedItem,
        icon: Icon(
          CupertinoIcons.chevron_down,
          color: AppColors.blue,
          size: 30,
        ),
        underline: Container(),
        elevation: 16,
        borderRadius: BorderRadius.circular(8),
        onChanged: (int? value) {
          setState(() {
            selectedItem = value!;
            widget.onChange(value);
          });
        },
        items: widget.colors.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Container(
              height: 30,
              width: 40,
              color: Colors.primaries[value % 20],
            ),
          );
        }).toList(),
      ),
    );
  }
}
