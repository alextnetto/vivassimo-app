import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/features/products_announcement/infra/models/product_announcement_request_model.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_delivery_store.dart';
import 'package:my_app/features/products_announcement/presentation/widgets/delivery_type_card_widget.dart';

class ProductAnnouncementDeliveryTypeScreen extends StatefulWidget {
  final ProductAnnouncementRequestModel productAnnouncementRequestModel;

  const ProductAnnouncementDeliveryTypeScreen({Key? key, required this.productAnnouncementRequestModel})
      : super(key: key);

  @override
  _ProductAnnouncementDeliveryTypeScreenState createState() => _ProductAnnouncementDeliveryTypeScreenState();
}

class _ProductAnnouncementDeliveryTypeScreenState extends State<ProductAnnouncementDeliveryTypeScreen> {
  ProductAnnouncementRequestModel get productModel => widget.productAnnouncementRequestModel;
  ProductAnnouncementDeliveryStore deliveryAnnouncementStore = Modular.get<ProductAnnouncementDeliveryStore>();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              // height: 120,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 216, 216, 0.2),
                border: Border(bottom: BorderSide(color: Color.fromRGBO(99, 95, 117, 0.2))),
              ),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Anunciar'),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressBar(textIndicator: '7/8', percentageValue: 0.875),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Como você quer entregar o seu produto?',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.defaultTextStyleTitleBig800,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Observer(builder: (_) {
              return Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 25, bottom: 40),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        deliveryAnnouncementStore.setIsToSendByCorreios(!deliveryAnnouncementStore.isToSendByCorreios);
                      },
                      child: DeliveryTypeCardWidget(
                        textCard: 'Enviar pelos \n Correios',
                        checkIconPath: deliveryAnnouncementStore.isToSendByCorreios
                            ? 'assets/icon/checked_icon.png'
                            : 'assets/icon/unchecked_icon.png',
                        cardColor: Color(0XFF22AB86),
                        textColor: Color(0XFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        deliveryAnnouncementStore
                            .setIsToNegotiateWithBuyer(!deliveryAnnouncementStore.isToNegotiateWithBuyer);
                      },
                      child: DeliveryTypeCardWidget(
                        textCard: 'Combinar com \n o comprador',
                        checkIconPath: deliveryAnnouncementStore.isToNegotiateWithBuyer
                            ? 'assets/icon/checked_icon_yellow.png'
                            : 'assets/icon/unchecked_icon_yellow.png',
                        cardColor: Color(0XFFFFB640),
                        textColor: Color(0XFF4D0351),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Observer(builder: (_) {
                return ButtonConfirm(
                  label: 'Continuar',
                  primary: Color(0xFF22AB86),
                  textColor: Color(0xFFFFFFFF),
                  borderColor: deliveryAnnouncementStore.enableButton ? Color(0xFF006633) : Colors.grey,
                  onPressed: deliveryAnnouncementStore.enableButton
                      ? () {
                          productModel.isToSendByCorreios = deliveryAnnouncementStore.isToSendByCorreios;
                          productModel.isToNegotiateDeliveryWithBuyer =
                              deliveryAnnouncementStore.isToNegotiateWithBuyer;

                          Navigator.of(context)
                              .pushNamed('/product/products_announcement/product_announcement_review', arguments: {
                            'productAnnouncementRequestModel': productModel,
                          });
                        }
                      : null,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
