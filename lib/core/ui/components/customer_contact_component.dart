import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class CustomerContactComponent extends StatelessWidget {
  final String phoneNumber;
  const CustomerContactComponent({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '(011 99999-9999)',
          style: customTextStyle(FontWeight.bold, 23, Color(0xff635F75)),
        ),
        Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            color: Color(0xff22AB86),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  'Ligar',
                  style: customTextStyle(FontWeight.bold, 18, Colors.white),
                ),
                SizedBox(width: 15),
                Icon(Icons.phone, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
