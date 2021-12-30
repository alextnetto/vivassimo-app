import 'package:flutter/material.dart';
import 'package:my_app/core/entities/service_entity.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/customer_contact_component.dart';
import 'package:my_app/core/ui/components/payment_methods_component.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'package:my_app/features/products_announcement/presentation/widgets/product_announcemente_rating_widget.dart';
import 'package:my_app/features/products_purchase/infra/models/request/service_purchase_request_model.dart';

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
                        onPressed: () {
                          if (AppHelpers.isInternetActive) {
                            executeServiceAction();
                          } else {
                            Navigator.of(context).pushNamed('/internet-connection', arguments: {
                              'executeAction': executeServiceAction,
                            });
                          }
                        },
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
          SizedBox(height: 15),
          Divider(color: Color(0xFFB4D8D8), thickness: 1),
          PaymentMethodsComponent(),
          Container(
            padding: const EdgeInsets.only(left: 22, right: 18),
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Tenha mais saúde e qualidade de vida com a Health Fit',
                        style: AppTextStyles.defaultTextStyleTitle,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Envelhecer é bom e faz bem quando o corpo e mente permanecem ativos. Previna doenças como Alzheimer e Parkinson. Comece hoje com Pilates e aumente suas chances de viver plenamente a melhor idade.',
                          style: AppTextStyles.defaultTextStyleDescriptionGrey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text('Atendimento Health Fit', style: AppTextStyles.defaultTextStyleTitle),
                ),
                SizedBox(height: 20),
                CustomerContactComponent(phoneNumber: '(11) 99999-9999'),
                SizedBox(height: 25),
                Text(
                  'Av. Paulista, 323',
                  style: customTextStyle(FontWeight.bold, 18, Color(0XFF635F75)),
                ),
                Text(
                  'São Paulo/SP',
                  style: customTextStyle(FontWeight.bold, 18, Color(0XFF635F75)),
                ),
                SizedBox(height: 25),
                Text(
                  'Segunda à sexta',
                  style: customTextStyle(FontWeight.bold, 18, Color(0XFF635F75)),
                ),
                Text(
                  '6h às 21h',
                  style: customTextStyle(FontWeight.bold, 18, Color(0XFF635F75)),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 35, left: 22),
            child: Text('O que dizem sobre a Health Fit', style: AppTextStyles.defaultTextStyleDescriptionPurple),
          ),
          SizedBox(height: 10),
          ProductAnnouncementRatingWidget(
            amountStars: 5,
            customerName: 'José Carlos',
            ratingDate: '02/08/21',
            ratingDescription:
                'Excelentes profissionais!!! Bem qualificados, muito atenciosos e dedicados!!! Super recomendo!!',
            ratingIcon: 'assets/icon/smile_rating_icon.png',
          ),
          ProductAnnouncementRatingWidget(
            amountStars: 5,
            customerName: 'Maria Oliveira',
            ratingDate: '02/08/21',
            ratingDescription:
                'Excelentes profissionais!!! Bem qualificados, muito atenciosos e dedicados!!! Super recomendo!!',
            ratingIcon: 'assets/icon/smile_rating_icon.png',
          ),
          ProductAnnouncementRatingWidget(
            amountStars: 5,
            customerName: 'Alberto Torres',
            ratingDate: '02/08/21',
            ratingDescription:
                'Excelentes profissionais!!! Bem qualificados, muito atenciosos e dedicados!!! Super recomendo!!',
            ratingIcon: 'assets/icon/smile_rating_icon.png',
          ),
        ],
      ),
    );
  }

  void executeServiceAction() {
    Navigator.of(context).pushNamed('/signin_or_signup', arguments: {
      'redirectTo': '/services-purchase/select-section-amount',
      'nextPageArguments': {
        'servicePurchaseRequestModel': ServicePurchaseRequestModel(
          serviceEntity: ServiceEntity(
            id: 1,
            name: 'Pilates Clássico',
            description: 'Pilates Clássico + aconselhamento e acompanhamento individual',
            ownerName: 'Academia Health Fit',
            value: 165,
            sessionDuration: '1 hora',
          ),
          maxInstallments: 3,
        ),
      }
    });
  }
}
