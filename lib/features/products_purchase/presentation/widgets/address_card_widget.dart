import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class AddressCardWidget extends StatelessWidget {
  final String streetAndNumber;
  final String cityAndState;
  final String cep;
  final String checkIconPath;
  final Color cardColor;

  const AddressCardWidget(
      {Key? key,
      required this.streetAndNumber,
      required this.cityAndState,
      required this.cep,
      required this.checkIconPath,
      required this.cardColor})
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
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  streetAndNumber,
                  style: customTextStyle(FontWeight.w600, 18, Colors.white),
                ),
                Text(
                  cityAndState,
                  style: customTextStyle(FontWeight.w600, 18, Colors.white),
                ),
                Text(
                  cep,
                  style: customTextStyle(FontWeight.w600, 18, Colors.white),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: SizedBox(child: Image.asset(checkIconPath))),
        ],
      ),
    );
  }
}
