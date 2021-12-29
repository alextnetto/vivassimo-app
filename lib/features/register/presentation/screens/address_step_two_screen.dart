import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/app_services/location_handler/models/cep_response_model.dart';
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
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/presentation/stores/address_step_two_store.dart';

class AddressStepTwoScreen extends StatefulWidget {
  const AddressStepTwoScreen({Key? key, required this.registerUserRequestModel, required this.cepResponseModel})
      : super(key: key);
  final RegisterUserRequestModel registerUserRequestModel;
  final CepResponseModel cepResponseModel;

  @override
  _AddressStepTwoScreenState createState() => _AddressStepTwoScreenState();
}

class _AddressStepTwoScreenState extends State<AddressStepTwoScreen> {
  RegisterUserRequestModel get registerUserRequestModel => widget.registerUserRequestModel;
  CepResponseModel get cepResponseModel => widget.cepResponseModel;

  AddressStepTwoStore addressStepTwoStore = Modular.get<AddressStepTwoStore>();

  @override
  void initState() {
    addressStepTwoStore.setAddressByCep(cepResponseModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: 'registerAppBar',
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                color: VivassimoTheme.white,
                child: Column(
                  children: const [
                    AppBarDefaultWidget(title: 'Criar uma conta'),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 35),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Informe seu endereço',
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
                      controller: addressStepTwoStore.cepController,
                      onChanged: (value) async {
                        if (value.length == 9) {
                          LoadingIndicator.show(context);
                          addressStepTwoStore.getAddressByCep(value, context).then((value) {
                            LoadingIndicator.hide(context);
                          });
                        }
                        addressStepTwoStore.setCep(value);
                      },
                      label: 'CEP',
                      inputFormatters: [AppMasks.cepFormatter],
                      errorText: addressStepTwoStore.getCepError,
                    );
                  }),
                  SizedBox(height: 16),
                  Observer(builder: (_) {
                    return AppTextField(
                      controller: addressStepTwoStore.addressController,
                      onChanged: addressStepTwoStore.setAddress,
                      label: 'Endereço',
                      errorText: addressStepTwoStore.getAddressError,
                    );
                  }),
                  SizedBox(height: 16),
                  Observer(builder: (_) {
                    return AppTextField(
                      controller: addressStepTwoStore.numberController,
                      onChanged: addressStepTwoStore.setNumber,
                      label: 'Número',
                      errorText: addressStepTwoStore.getNumberError,
                    );
                  }),
                  SizedBox(height: 16),
                  Observer(builder: (_) {
                    return AppTextField(
                      controller: addressStepTwoStore.neighborhoodController,
                      onChanged: addressStepTwoStore.setNeighborhood,
                      label: 'Bairro',
                      errorText: addressStepTwoStore.getNeighborhoodError,
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
                            contentStyle: customTextStyle(
                              FontWeight.w700,
                              18,
                              VivassimoTheme.purpleActive,
                            ),
                            labelText: 'UF',
                            onChanged: (value) {
                              addressStepTwoStore.setUf(value ?? '');
                            },
                            storeValue: addressStepTwoStore.uf,
                            borderColor: VivassimoTheme.purpleActive,
                          );
                        }),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Observer(builder: (_) {
                          return AppTextField(
                            controller: addressStepTwoStore.cityController,
                            onChanged: addressStepTwoStore.setCity,
                            label: 'Cidade',
                            errorText: addressStepTwoStore.getCityError,
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    onChanged: addressStepTwoStore.setComplement,
                    label: 'Complemento',
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Hero(
              tag: 'registerButtonConfirm',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(builder: (_) {
                  return ButtonConfirm(
                    label: 'Salvar Endereço',
                    primary: VivassimoTheme.green,
                    textColor: VivassimoTheme.white,
                    borderColor: addressStepTwoStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
                    // onPressed: addressStepTwoStore.ena () {
                    onPressed: addressStepTwoStore.enableButton
                        ? () {
                            registerUserRequestModel.address = AddressEntity(
                              zipCode: addressStepTwoStore.cep,
                              street: addressStepTwoStore.address,
                              number: addressStepTwoStore.number,
                              neighborhood: addressStepTwoStore.neighborhood,
                              city: addressStepTwoStore.city,
                              state: addressStepTwoStore.uf,
                            );
                            print(registerUserRequestModel.toJson());
                          }
                        : null,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
