import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';
import 'package:udevs_todo/core/constants/device_frame.dart';
import 'package:udevs_todo/core/constants/svg_icons.dart';
import 'package:udevs_todo/core/constants/text_styles.dart';
import 'package:udevs_todo/domain/entities/extensions/svg_ext.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.backPress,
    required this.editPress,
    required this.title,
    required this.description,
    required this.time,
    required this.location,
  });

  final void Function() backPress;
  final void Function() editPress;
  final String title;
  final String description;
  final String time;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.38,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: MediaQuery.sizeOf(context).height * 0.08,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.back,
                            color: AppColors.black,
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: editPress,
                    child: Row(
                      children: [
                        SvgIcons.edit.copyWith(
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          "Edit",
                          style: Styles.poppins500.copyWith(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              FixSize.sized(context, height: 0.03),
              Text(
                title,
                style: Styles.poppins600.copyWith(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
              FixSize.sized(context, height: 0.01),
              Text(
                description,
                style: Styles.poppins400.copyWith(
                  color: AppColors.white,
                  fontSize: 10,
                ),
              ),
              FixSize.sized(context, height: 0.03),
              Row(
                children: [
                  SvgIcons.roundAccessTimeFilled.copyWith(
                    color: AppColors.white,
                    width: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    time,
                    style: Styles.poppins500.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              FixSize.sized(context, height: 0.02),
              Row(
                children: [
                  SvgIcons.fluentLocationFilled.copyWith(
                    color: AppColors.white,
                    width: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    location,
                    style: Styles.poppins500.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
