import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/entities/delivery_address_entity.dart';
import 'package:my_app/core/ui/app_masks/app_masks.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_dropdown_list.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/widgets/loading_indicator.dart';
import 'package:my_app/core/utils/constants/constants.dart';
import 'package:my_app/features/products/products_purchase/presentation/stores/delivery_address_store.dart';
import 'package:my_app/features/products/products_purchase/presentation/stores/new_delivery_address_store.dart';

class NewDeliveryAddressScreen extends StatefulWidget {
  final DeliveryAddressStore deliveryStore;
  const NewDeliveryAddressScreen({Key? key, required this.deliveryStore}) : super(key: key);

  @override
  _NewDeliveryAddressScreenState createState() => _NewDeliveryAddressScreenState();
}

class _NewDeliveryAddressScreenState extends State<NewDeliveryAddressScreen> {
  DeliveryAddressStore get deliveryStore => widget.deliveryStore;

  NewDeliveryAddressStore newAddressStore = Modular.get<NewDeliveryAddressStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              // height: 131,
              padding: const EdgeInsets.only(top: 25),
              // decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Endereço'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Endereço para entrega',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.defaultTextStyleTitleBig800,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 46, right: 46, top: 42),
              child: Column(
                children: [
                  Observer(builder: (_) {
                    return AppTextField(
                      controller: newAddressStore.cepController,
                      onChanged: (value) async {
                        if (value.length == 9) {
                          LoadingIndicator.show(context);
                          newAddressStore.getAddressByCep(value, context).then((value) {
                            LoadingIndicator.hide(context);
                          });
                        }
                        newAddressStore.setCep(value);
                      },
                      label: 'CEP',
                      inputFormatters: [AppMasks.cep],
                      errorText: newAddressStore.getCepError,
                    );
                  }),
                  SizedBox(height: 16),
                  Observer(builder: (_) {
                    return AppTextField(
                      controller: newAddressStore.addressController,
                      onChanged: newAddressStore.setAddress,
                      label: 'Endereço',
                      errorText: newAddressStore.getAddressError,
                    );
                  }),
                  SizedBox(height: 16),
                  Observer(builder: (_) {
                    return AppTextField(
                      controller: newAddressStore.numberController,
                      onChanged: newAddressStore.setNumber,
                      label: 'Número',
                      errorText: newAddressStore.getNumberError,
                    );
                  }),
                  SizedBox(height: 16),
                  Observer(builder: (_) {
                    return AppTextField(
                      controller: newAddressStore.neighborhoodController,
                      onChanged: newAddressStore.setNeighborhood,
                      label: 'Bairro',
                      errorText: newAddressStore.getNeighborhoodError,
                    );
                  }),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                        height: 58,
                        child: Observer(builder: (_) {
                          return DropdownListWidget(
                            contentList: ListStringConstants.ufs,
                            labelText: newAddressStore.uf,
                            onChanged: (value) {
                              newAddressStore.setUf(value ?? '');
                            },
                            storeValue: newAddressStore.uf,
                          );
                        }),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Observer(builder: (_) {
                          return AppTextField(
                            controller: newAddressStore.cityController,
                            onChanged: newAddressStore.setCity,
                            label: 'Cidade',
                            errorText: newAddressStore.getCityError,
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    onChanged: newAddressStore.setComplement,
                    label: 'Complemento',
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Observer(builder: (_) {
              return Container(
                margin: const EdgeInsets.only(top: 46),
                child: ButtonConfirm(
                  label: 'Salvar Endereço',
                  primary: VivassimoTheme.green,
                  textColor: VivassimoTheme.white,
                  borderColor: newAddressStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
                  // onPressed: newAddressStore.ena () {
                  onPressed: newAddressStore.enableButton
                      ? () {
                          deliveryStore.addDeliveryAddress(DeliveryAddressEntity(
                            id: deliveryStore.deliveryAddresses.length + 1,
                            cep: newAddressStore.cep,
                            city: newAddressStore.city,
                            neighborhood: newAddressStore.neighborhood,
                            number: newAddressStore.number,
                            street: newAddressStore.address,
                            uf: newAddressStore.uf,
                            complement: newAddressStore.complement,
                          ));
                          
                          Navigator.of(context).pop();
                        }
                      : null,
                ),
              );
            }),
          )
        ],
      ),
      // bottomNavigationBar: SizedBox(
      //   // margin: const EdgeInsets.only(top: 66),
      //   child: Observer(builder: (_) {
      //     return ButtonConfirm(
      //       label: 'Salvar Endereço',
      //       primary: VivassimoTheme.green,
      //       textColor: VivassimoTheme.white,
      //       borderColor: newAddressStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
      //       // onPressed: newAddressStore.ena () {
      //       onPressed: newAddressStore.enableButton
      //           ? () {
      //               deliveryStore.addDeliveryAddress(DeliveryAddressEntity(
      //                 id: 2,
      //                 cep: newAddressStore.cep,
      //                 city: newAddressStore.city,
      //                 neighborhood: newAddressStore.neighborhood,
      //                 number: newAddressStore.number,
      //                 street: newAddressStore.address,
      //                 uf: newAddressStore.uf,
      //               ));
      //               print('sdjfiosdj');
      //               Navigator.of(context).pop();
      //             }
      //           : null,
      //     );
      //   }),
      // ),
    );
  }
}
