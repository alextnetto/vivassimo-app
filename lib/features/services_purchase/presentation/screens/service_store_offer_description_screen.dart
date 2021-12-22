import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';

class ServiceStoreOfferDescriptionScreen extends StatefulWidget {
  const ServiceStoreOfferDescriptionScreen({Key? key}) : super(key: key);

  @override
  _ServiceStoreOfferDescriptionScreenState createState() => _ServiceStoreOfferDescriptionScreenState();
}

class _ServiceStoreOfferDescriptionScreenState extends State<ServiceStoreOfferDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarDefaultWidget(title: 'Serviços'),
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/services_purchase/service_store.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 22, right: 40),
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Academia Health Fit',
                  style: AppTextStyles.defaultTextStyleTitleMiddleBold,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Pilates Clássico + aconselhamento e acompanhamento individual',
                        style: AppTextStyles.defaultTextStyleDescriptionGrey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 185,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Container(
                      padding: EdgeInsets.only(top: 13, right: 23, bottom: 56, left: 22),
                      alignment: Alignment.topLeft,
                      height: 157,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'De R\$ ',
                              style: customTextStyle(FontWeight.w600, 18, Color(0XFF635F75)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '330,00',
                                  style: customTextStyle(
                                    FontWeight.w600,
                                    18,
                                    Color(0XFF635F75),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: RichText(
                              text: TextSpan(
                                text: 'por ',
                                style: customTextStyle(FontWeight.w600, 18, Color(0XFF635F75)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'R\$ 165,00',
                                    style: customTextStyle(FontWeight.w800, 26, Color(0XFF22AB86)),
                                  ),
                                  TextSpan(
                                      text: ' a vista', style: customTextStyle(FontWeight.w600, 18, Color(0XFF635F75))),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ou em até 3x sem juros de R\$ 55,00',
                                  style: customTextStyle(FontWeight.bold, 18, Color(0XFF635F75)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(180, 216, 216, 0.2),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          border: Border.all(color: Color.fromRGBO(99, 95, 117, 0.2))),
                    ),
                  ),
                  Positioned(
                    top: 123,
                    left: 45,
                    right: 45,
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            elevation: 0,
                            primary: Color(0xFF22AB86),
                            // fixedSize: Size(324, 60),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2.0,
                                  color: Color(0xFF006633),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.shopping_cart_sharp,
                              size: 29,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Quero Comprar',
                              style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
