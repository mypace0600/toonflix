import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String money;
  final String number;
  final String shortName;
  final Color bgColor;
  final Color textColor;
  final IconData iconName;
  final double offsetData;

  const MyCard({
    super.key,
    required this.money,
    required this.number,
    required this.shortName,
    required this.bgColor,
    required this.textColor,
    required this.iconName,
    required this.offsetData,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offsetData),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    money,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        number,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        shortName,
                        style: TextStyle(
                          color: textColor.withOpacity(0.65),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    iconName,
                    color: textColor,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
