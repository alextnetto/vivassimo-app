import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class StoreTileWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color backgroundColor;
  final BoxBorder? border;

  const StoreTileWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.backgroundColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(imagePath),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: customTextStyle(FontWeight.bold, 18, Color(0xFF560955)),
                  ),
                  Text(
                    description,
                    style: customTextStyle(FontWeight.w600, 18, Color(0xFF635F75)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            child: Image.asset('assets/icon/arrow_foward.png'),
          )
        ],
      ),
    );
  }
}
