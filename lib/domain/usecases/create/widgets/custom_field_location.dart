import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';
import 'package:udevs_todo/core/constants/svg_icons.dart';
import 'package:udevs_todo/data/services/location_service.dart';
import 'package:udevs_todo/domain/entities/extensions/svg_ext.dart';

class CustomFieldLocation extends StatelessWidget {
  const CustomFieldLocation({
    super.key,
    required this.controller,
    this.onPressed,
  });

  final void Function()? onPressed;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null) return "Please select location";
        if (text.isEmpty && text.length < 3) {
          return "at least 3 words";
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey100,
        constraints: const BoxConstraints(maxHeight: 60),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: GestureDetector(
          onTap: () async {
            final currentLocation = await GeoLocationService().currentLocation();
            if (currentLocation != null) {
              controller.text = currentLocation;
            }
            if (onPressed != null) {
              onPressed!();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: SvgIcons.fluentLocationFilled.copyWith(
              color: AppColors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
