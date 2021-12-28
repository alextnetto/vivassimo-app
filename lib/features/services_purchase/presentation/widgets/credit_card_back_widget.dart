import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/utils/enums/credit_card_enum.dart';

class CreditCardBackWidget extends StatelessWidget {
  final CardBrand brand;
  final String cvv;

  const CreditCardBackWidget({
    Key? key,
    required this.brand,
    required this.cvv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 223.14,
        padding: const EdgeInsets.only(right: 22, top: 29.39),
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
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(right: 25, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 23.0),
                  child: Text(
                    'CVV',
                    style: customTextStyle(FontWeight.bold, 18, Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 25),
                  height: 62,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(180, 216, 216, 0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(cvv, style: customTextStyle(FontWeight.bold, 23, Colors.white)),
                ),
              ],
            ),
          ),
        )

        // Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         // if (brand != CardBrand.otherBrand)
        //         //   Image.asset(getCredtiCardLogo())
        //         // else
        //         //   SizedBox(
        //         //     height: 24,
        //         //     width: 20,
        //         //   )
        //       ],
        //     ),
        //   ],
        // ),
        );
  }
}
