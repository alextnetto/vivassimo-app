import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_button.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';

class ProductPurchaseSuccessScreen extends StatefulWidget {
  const ProductPurchaseSuccessScreen({Key? key}) : super(key: key);

  @override
  _ProductPurchaseSuccessScreenState createState() => _ProductPurchaseSuccessScreenState();
}

class _ProductPurchaseSuccessScreenState extends State<ProductPurchaseSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  SizedBox(child: Image.asset('assets/backgrounds/main_image_success.png')),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    // width: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Compra realizada com sucesso!',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.defaultTextStyleTitleBig800,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 150),
                  Container(
                    margin: const EdgeInsets.only(bottom: 205),
                    width: double.infinity,
                    child: AppButton(
                      borderColor: Color(0XFF006633),
                      buttonColor: Color(0XFF22AB86),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      textColor: Color(0XFFFFFFFF),
                      title: 'Ver meus pedidos',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonConfirm(
                    label: 'Tela Inicial',
                    primary: Color(0XFFFFB640),
                    onPrimary: Color(0XFF4D0351),
                    borderColor: Color(0XFFFFB640),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
