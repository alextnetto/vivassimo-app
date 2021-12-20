import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class DeliveryTypeCardWidget extends StatelessWidget {
  final String textCard;
  final String checkIconPath;
  final Color cardColor;
  final Color textColor;

  const DeliveryTypeCardWidget(
      {Key? key, required this.textCard, required this.checkIconPath, required this.cardColor, required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 24.65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: cardColor,
      ),
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textCard,
                style: customTextStyle(FontWeight.bold, 23, textColor),
              ),
            ],
          ),
          SizedBox(child: Image.asset(checkIconPath)),
        ],
      ),
    );
  }
}
