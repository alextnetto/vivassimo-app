import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';

class CvvIndicatorScreen extends StatelessWidget {
  const CvvIndicatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromRGBO(0, 0, 0, 0.9),
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(0, 0, 0, 0.85),
        ),
        Container(
          margin: const EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 22, right: 22),
                  child: Text(
                    'O CVV é o código de segurança localizado atrás do seu cartão, são os últimos 3 dígitos.',
                    style: customTextStyle(FontWeight.bold, 23, Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  child: Image.asset(
                    'assets/images/services_purchase/cvv_indicator.png',
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 45),
                      height: 60,
                      child: CustomButton1(
                        borderColor: Color(0xFFDE674B),
                        label: 'Entendi',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        onPrimary: Color(0XFF4D0351),
                        primary: Color(0xFFFFB640),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
