import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_delivery_store.dart';
import 'package:my_app/features/products_announcement/presentation/widgets/delivery_type_card_widget.dart';

class ProductAnnouncementDeliveryScreen extends StatefulWidget {
  final List img;
  const ProductAnnouncementDeliveryScreen({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  _ProductAnnouncementDeliveryScreenState createState() => _ProductAnnouncementDeliveryScreenState();
}

class _ProductAnnouncementDeliveryScreenState extends State<ProductAnnouncementDeliveryScreen> {
  ProductAnnouncementDeliveryStore deliveryAnnouncementStore = Modular.get<ProductAnnouncementDeliveryStore>();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
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
                        deliveryAnnouncementStore.setDeliveryTypeId(1);
                      },
                      child: DeliveryTypeCardWidget(
                        textCard: 'Enviar pelos \n Correios',
                        checkIconPath: deliveryAnnouncementStore.deliveryTypeId == 1
                            ? 'assets/icon/checked_icon.png'
                            : 'assets/icon/unchecked_icon.png',
                        cardColor: Color(0XFF22AB86),
                        textColor: Color(0XFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        deliveryAnnouncementStore.setDeliveryTypeId(2);
                      },
                      child: DeliveryTypeCardWidget(
                        textCard: 'Combinar com \n o comprador',
                        checkIconPath: deliveryAnnouncementStore.deliveryTypeId == 2
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
              child: ButtonConfirm(
                label: 'Continuar',
                primary: Color(0xFF22AB86),
                textColor: Color(0xFFFFFFFF),
                borderColor: Color(0xFF006633),
                onPressed: () {
                  Navigator.of(context).pushNamed('/product/products_announcement/product_announcement_review',
                      arguments: {'img': widget.img});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
