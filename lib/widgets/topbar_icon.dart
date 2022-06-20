import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarIcon extends StatelessWidget {
  const TopBarIcon({
    Key? key,
    this.margin = const EdgeInsets.all(0),
    this.color = Colors.white,
    this.iconColor = Colors.black,
    required this.myIcon,
    required this.onClick,
  }) : super(key: key);

  final myIcon, onClick, margin, color, iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: IconButton(
          icon: Icon(
            myIcon,
            color: iconColor,
            size: 16,
          ),
          onPressed: onClick),
    );
  }
}
