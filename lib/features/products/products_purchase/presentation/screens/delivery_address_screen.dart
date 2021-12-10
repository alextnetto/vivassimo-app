import 'package:flutter/material.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 131,
            padding: const EdgeInsets.only(top: 25),
            decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
            child: Column(
              children: const [
                AppBarDefaultWidget(title: 'Endereço de Entrega'),
                SizedBox(
                  height: 10,
                ),
                LinearProgressBar(textIndicator: '1/4', percentageValue: 0.25),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Compre com segurança e tenha a garantia do dinheiro de volta com a Vivássimo.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.defaultTextStyleDescriptionPurple,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Qual o endereçode entrega?',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.defaultTextStyleTitleBig,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 24.65),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0XFF22AB86),
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
                            'Av. Paulista, 930',
                            style: customTextStyle(FontWeight.w600, 18, Colors.white),
                          ),
                          Text(
                            'Centro - São Paulo/SP',
                            style: customTextStyle(FontWeight.w600, 18, Colors.white),
                          ),
                          Text(
                            'CEP 06455-55',
                            style: customTextStyle(FontWeight.w600, 18, Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(child: Image.asset('assets/icon/checked_icon.png')),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 45),
                  child: CustomButton1(
                    borderColor: Color(0xFFDE674B),
                    label: 'Novo Endereço',
                    onPressed: () {},
                    onPrimary: Color(0XFF4D0351),
                    primary: Color(0xFFFFB640),
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 45),
                  child: CustomButton1(
                    borderColor: Color(0xFFB4D8D8),
                    label: 'Excluir um Endereço',
                    onPressed: () {},
                    onPrimary: Color(0XFF4D0351),
                    primary: Color(0xFFE9F3F4),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 66),
            child: ButtonConfirm(
              label: 'Continuar',
              primary: VivassimoTheme.green,
              onPrimary: VivassimoTheme.white,
              borderColor: VivassimoTheme.greenBorderColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
