import 'dart:ui';
import 'package:flutter_svg/svg.dart';

extension SvgExt on SvgPicture {
  SvgPicture copyWith({double? width, double? height, Color? color}) {
    return SvgPicture(
      bytesLoader,
      width: width ?? this.width,
      height: height ?? this.height,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : colorFilter,
    );
  }
}