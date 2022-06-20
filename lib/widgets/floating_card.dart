import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';

class FloatingCard extends StatelessWidget {
  const FloatingCard({
    Key? key,
    required this.title,
    required this.ratings,
    required this.comments,
    required this.type,
    required this.distance,
    required this.time,
  }) : super(key: key);

  final title, ratings, comments, type, distance, time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      height: 100,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: Const.headerFontSize, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Wrap(
                  children: List.generate(
                    int.parse(ratings),
                    (index) => const Text(
                      '⭐',
                      style: Const.subHeadingStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  ratings,
                  style: Const.subHeadingStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$comments comments',
                  style: Const.subHeadingStyle,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    type,
                    style: Const.subHeadingStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('$distance', style: Const.subHeadingStyle),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$time min',
                    style: Const.subHeadingStyle,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}