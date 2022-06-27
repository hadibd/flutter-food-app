import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const.dart';

class ProfileBodyItem extends StatelessWidget {
  const ProfileBodyItem({
    Key? key,
    required this.title,
    required this.data,
    required this.onClick,
  }) : super(key: key);

  final title, data, onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Const.subHeadingStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
              IconButton(
                  onPressed: onClick,
                  icon: const FaIcon(
                    FontAwesomeIcons.penToSquare,
                    size: 16,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
