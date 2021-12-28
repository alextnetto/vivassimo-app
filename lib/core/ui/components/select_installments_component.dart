import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class SelectAmountComponent extends StatelessWidget {
  final String installments;
  final Function() onTapIncrease;
  final Function() onTapDecrease;
  const SelectAmountComponent(
      {Key? key, required this.installments, required this.onTapIncrease, required this.onTapDecrease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 8, right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFF635F75)),
              color: Colors.white,
            ),
            height: 47,
            width: 246,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    installments,
                    textAlign: TextAlign.center,
                    style: customTextStyle(FontWeight.w800, 30, Color(0XFF4D0351)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: GestureDetector(
              child: Image.asset('assets/icon/minus_button.png'),
              onTap: onTapDecrease,
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              child: GestureDetector(
                child: Image.asset('assets/icon/plus_button.png'),
                onTap: onTapIncrease,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
