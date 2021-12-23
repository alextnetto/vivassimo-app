import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/formatters/display_value_formatter.dart';
import 'package:my_app/features/services_purchase/presentation/stores/new_credit_card_store.dart';
import 'package:my_app/features/services_purchase/presentation/stores/payment_method_service_store.dart';

class NewCreditCardScreen extends StatefulWidget {
  final PaymentMethodServiceStore paymentStore;
  const NewCreditCardScreen({Key? key, required this.paymentStore}) : super(key: key);

  @override
  _NewCreditCardScreenState createState() => _NewCreditCardScreenState();
}

class _NewCreditCardScreenState extends State<NewCreditCardScreen> {
  PaymentMethodServiceStore get paymentStore => widget.paymentStore;
  NewCreditCardStore creditCardStore = Modular.get<NewCreditCardStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 320,
              child: Stack(
                children: [
                  Container(
                    height: 131,
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(180, 216, 216, 0.2),
                        border: Border(bottom: BorderSide(color: Color.fromRGBO(99, 95, 117, 0.2)))),
                    child: Column(
                      children: const [
                        AppBarDefaultWidget(title: 'Novo cartão'),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      // margin: const EdgeInsets.only(left: 22, right: 22),
                      padding: const EdgeInsets.only(left: 22, right: 22),
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: 223.14,
                        padding: const EdgeInsets.only(left: 22, right: 22, top: 29.39),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: const [
                              Color(0xff4D0351),
                              Color(0xff2C0833),
                            ],
                            begin: const FractionalOffset(0.5, 0.0),
                            end: const FractionalOffset(0.8, 0.5),
                            stops: const [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                        child: Observer(builder: (_) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [Image.asset('assets/icon/payment_methods_icons/visa_logo_white.png')],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(top: 52),
                                child: Text(
                                  creditCardStore.number,
                                  style: customTextStyle(FontWeight.w800, 26, Colors.white),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    creditCardStore.name.toUpperCase(),
                                    style: customTextStyle(FontWeight.bold, 18, Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 25, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      creditCardStore.expireDate,
                                      style: customTextStyle(FontWeight.bold, 18, Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              margin: const EdgeInsets.only(top: 35),
              child: Column(
                children: [
                  AppTextField(
                    label: 'Digite os números do cartão',
                    onChanged: creditCardStore.setNumber,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      AppFormatter.creditCardInputFormatter,
                    ],
                    errorText: creditCardStore.getNumberError,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    label: 'Digite o nome impresso no cartão',
                    onChanged: creditCardStore.setName,
                    textAlign: TextAlign.center,
                    errorText: creditCardStore.getNameError,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    label: 'Digite a validade do cartão',
                    onChanged: creditCardStore.setExpireDate,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      AppFormatter.dateInputFormatter,
                    ],
                    errorText: creditCardStore.getExpireDateError,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 65)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              // margin: const EdgeInsets.only(top: 66),
              child: Observer(builder: (_) {
                return ButtonConfirm(
                  label: 'Continuar',
                  primary: VivassimoTheme.green,
                  textColor: VivassimoTheme.white,
                  borderColor: creditCardStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
                  onPressed: creditCardStore.enableButton
                      ? () {
                          Navigator.of(context).pushNamed('/services-purchase/new-credit-card-cvv', arguments: {
                            'paymentStore': paymentStore,
                            'creditCardStore': creditCardStore,
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
