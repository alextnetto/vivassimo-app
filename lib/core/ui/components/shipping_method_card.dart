import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class ShippingMethodCard extends StatelessWidget {
  final String title;
  final String shippingValue;
  final String deliveryTime;
  final String iconPath;

  const ShippingMethodCard(
      {Key? key, required this.title, required this.shippingValue, required this.deliveryTime, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
      padding: const EdgeInsets.symmetric(horizontal: 25.65),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0XFFE9F3F4),
          border: Border.all(color: Color(0XFFB4D8D8))),
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
                title,
                style: customTextStyle(FontWeight.bold, 23, Color(0XFF4D0351)),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valor',
                        style: customTextStyle(FontWeight.bold, 18, Color(0XFF4D0351)),
                      ),
                      Text(
                        shippingValue,
                        style: customTextStyle(FontWeight.w600, 18, Color(0XFF22AB86)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prazo',
                        style: customTextStyle(FontWeight.bold, 18, Color(0XFF4D0351)),
                      ),
                      Text(
                        deliveryTime,
                        style: customTextStyle(FontWeight.w600, 18, Color(0XFF4D0351)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(child: Image.asset(iconPath)),
        ],
      ),
    );
  }
}
