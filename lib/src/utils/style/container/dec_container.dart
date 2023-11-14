import 'package:flutter/material.dart';

Widget shadowedBox({
  Widget? child,
  Color? shadowColor,
  Color? backgroundColor,
  BorderRadius? borderRadius,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      color: backgroundColor ?? Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? Colors.grey.withOpacity(0.3),
          blurRadius: 20.0,
          spreadRadius: 2.0,
          offset: const Offset(0.5, 0.5),
        )
      ],
    ),
    child: child,
  );
}
