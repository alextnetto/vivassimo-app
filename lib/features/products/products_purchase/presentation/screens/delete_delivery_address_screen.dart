import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/features/products/products_purchase/presentation/stores/delete_delivery_address_store.dart';
import 'package:my_app/features/products/products_purchase/presentation/widgets/address_card_widget.dart';
import 'package:my_app/core/ui/components/modal_bottom_sheet_delete_component.dart';

class DeleteDeliveryAddressScreen extends StatefulWidget {
  const DeleteDeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  _DeleteDeliveryAddressScreenState createState() => _DeleteDeliveryAddressScreenState();
}

class _DeleteDeliveryAddressScreenState extends State<DeleteDeliveryAddressScreen> {
  DeleteDeliveryAddressStore deleteAddressStore = Modular.get<DeleteDeliveryAddressStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              AppBarDefaultWidget(title: 'Excluir Endereço'),
              Container(
                margin: const EdgeInsets.only(top: 42),
                width: 220,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Qual endereço deseja excluir?',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.defaultTextStyleTitleBig800,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.only(top: 35),
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          deleteAddressStore.setDeliveryAddressId(1);
                        },
                        child: AddressCardWidget(
                          streetAndNumber: 'Av. Paulista, 333',
                          cep: 'CEP 06455-55',
                          checkIconPath: deleteAddressStore.deliveryAddressId == 1
                              ? 'assets/icon/checked_icon.png'
                              : 'assets/icon/unchecked_icon.png',
                          cityAndState: 'Centro - São Paulo/SP',
                          cardColor: Color(0XFFFF3300),
                        ),
                      );
                    }),
                    SizedBox(height: 25),
                    Observer(builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          deleteAddressStore.setDeliveryAddressId(2);
                        },
                        child: AddressCardWidget(
                          streetAndNumber: 'Av. Paulista, 930',
                          cep: 'CEP 06455-55',
                          checkIconPath: deleteAddressStore.deliveryAddressId == 2
                              ? 'assets/icon/checked_icon.png'
                              : 'assets/icon/unchecked_icon.png',
                          cityAndState: 'Centro - São Paulo/SP',
                          cardColor: Color(0XFFFF3300),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: ButtonConfirm(
        label: 'Excluir',
        primary: Color(0XFFFFB640),
        textColor: Color(0XFF4D0351),
        borderColor: Color(0XFFDE674B),
        onPressed: () {
          ModalBottomSheetDeleteComponentWidget.showModalDeleteComponent(
            context: context,
            cancelButtomText: 'Cancelar',
            confirmButtomText: 'Sim, excluir',
            deleteMessage: 'Deseja excluir \n este endereço?',
          );
        },
      ),
    );
  }
}
