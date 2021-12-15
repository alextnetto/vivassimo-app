import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/core/entities/delivery_address_entity.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/features/products/products_purchase/presentation/stores/delivery_address_store.dart';
import 'package:my_app/features/products/products_purchase/presentation/widgets/address_card_widget.dart';

import '../../products_purchase_module.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  DeliveryAddressStore? deliveryStore;
  @override
  void initState() {
    initModule(ProductsPurchaseModule());
    deliveryStore = Modular.get<DeliveryAddressStore>();

    deliveryStore!.addDeliveryAddress(DeliveryAddressEntity(
      cep: '06455-555',
      city: 'São Paulo',
      neighborhood: 'Centro',
      number: '930',
      street: 'Av. Paulista',
      uf: 'SP',
    ));

    super.initState();
  }

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
                          'Qual o endereço de entrega?',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.defaultTextStyleTitleBig,
                        ),
                      )
                    ],
                  ),
                ),
                Observer(builder: (_) {
                  return Column(children: [
                    for (int index = 0; index < deliveryStore!.deliveryTest.length; index++)
                      buildAddressCard(deliveryStore!.deliveryTest[index])
                  ]);
                }),
                // AddressCardWidget(
                //   streetAndNumber: 'Av. Paulista, 930',
                //   cep: 'CEP 06455-55',
                //   checkIconPath: 'assets/icon/checked_icon.png',
                //   cityAndState: 'Centro - São Paulo/SP',
                //   cardColor: Color(0XFF22AB86),
                // ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 45),
                  child: CustomButton1(
                    borderColor: Color(0xFFDE674B),
                    label: 'Novo Endereço',
                    onPressed: () async {
                      var newAddress = await Navigator.of(context)
                          .pushNamed('/products/products_purchase/new_delivery_address', arguments: {
                        'deliveryStore': deliveryStore,
                      });

                      if (newAddress != null) {
                        print('gsdfg');

                        setState(() {
                          deliveryStore!.deliveryTest.add(newAddress as DeliveryAddressEntity);
                        });
                      }
                    },
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
                    onPressed: () {
                      Navigator.of(context).pushNamed('/products/products_purchase/delete_delivery_address');
                    },
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
              onPressed: () {
                Navigator.of(context).pushNamed('/products/products_purchase/shipping_method');
              },
            ),
          ),
        ],
      ),
    );
  }

  buildAddressCard(DeliveryAddressEntity deliveryAddress) {
    return AddressCardWidget(
      streetAndNumber: '${deliveryAddress.street}, ${deliveryAddress.number}',
      cep: '${deliveryAddress.cep}',
      checkIconPath: 'assets/icon/checked_icon.png',
      cityAndState: 'Centro - São Paulo/SP',
      cardColor: Color(0XFF22AB86),
    );
  }
}
