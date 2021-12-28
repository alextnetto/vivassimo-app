import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/utils/enums/credit_card_enum.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';

class CreditCardWidget extends StatelessWidget {
  final CardBrand brand;
  final String number;
  final String ownerName;
  final String expirationDate;

  const CreditCardWidget({
    Key? key,
    required this.brand,
    required this.number,
    required this.ownerName,
    required this.expirationDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 223.14,
      padding: const EdgeInsets.only(left: 22, right: 22, top: 29.39),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: const [
            Color(0xff4D0351),
            Color(0xff2C0833),
          ],
          begin: const FractionalOffset(0.5, 0.0),
          end: const FractionalOffset(0.8, 0.5),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (brand != CardBrand.otherBrand)
                Image.asset(AppHelpers.getCredtiCardLogoWhite(brand))
              else
                SizedBox(
                  height: 24,
                  width: 20,
                )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 26),
                child: Image.asset('assets/icon/credit_card_chip.png'),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              number.isNotEmpty ? number : 'xxxx xxxx xxxx xxxx',
              style: customTextStyle(FontWeight.w800, 26, Colors.white),
            ),
          ),
          Row(
            children: [
              Text(
                ownerName.toUpperCase(),
                style: customTextStyle(FontWeight.bold, 18, Colors.white),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 25, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  expirationDate.isNotEmpty ? expirationDate : 'xx/xxxx',
                  style: customTextStyle(FontWeight.bold, 18, Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
