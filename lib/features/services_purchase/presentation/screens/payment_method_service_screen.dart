import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/components/select_installments_component.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_button.dart';
import 'package:my_app/core/ui/widgets/app_dropdown_list_with_model.dart';
import 'package:my_app/features/products_purchase/domain/entities/payment_method_entity.dart';
import 'package:my_app/features/products_purchase/infra/models/request/service_purchase_request_model.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/payment_method_store.dart';

class PaymentMethodServiceScreen extends StatefulWidget {
  final ServicePurchaseRequestModel servicePurchaseRequestModel;

  const PaymentMethodServiceScreen({Key? key, required this.servicePurchaseRequestModel}) : super(key: key);

  @override
  _PaymentMethodServiceScreenState createState() => _PaymentMethodServiceScreenState();
}

class _PaymentMethodServiceScreenState extends State<PaymentMethodServiceScreen> {
  ServicePurchaseRequestModel get servicePurchaseRequestModel => widget.servicePurchaseRequestModel;
  PaymentMethodStore paymentStore = Modular.get<PaymentMethodStore>();

  @override
  void initState() {
    paymentStore.setPurchaseValue(servicePurchaseRequestModel.totalPurchase!);
    paymentStore.maxInstallments = servicePurchaseRequestModel.maxInstallments!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          Container(
            // height: 131,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 15),
            decoration: BoxDecoration(
              color: Color.fromRGBO(180, 216, 216, 0.2),
              border: Border(bottom: BorderSide(color: Color.fromRGBO(99, 95, 117, 0.2))),
            ),
            child: Column(
              children: const [
                AppBarDefaultWidget(title: 'Pagamento'),
                SizedBox(
                  height: 10,
                ),
                LinearProgressBar(textIndicator: '2/3', percentageValue: 0.66),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: 150,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Qual a forma de pagamento deseja usar?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.defaultTextStyleTitleBig800,
                  ),
                )
              ],
            ),
          ),
          Observer(builder: (_) {
            return Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: DropdownListWithModelWidget(
                contentList: paymentStore.creditCardEntities,
                contentStyle: customTextStyle(FontWeight.bold, 18, Colors.white),
                fillCollor: Color(0XFF22AB86),
                icon: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Image.asset(
                    'assets/icon/arrow_downward.png',
                    width: 20,
                  ),
                ),
                onChanged: (value) {
                  paymentStore.setPaymentMethod(value);
                },
                selectedValue: paymentStore.paymentMethod,
              ),
            );
          }),
          AppButton(
            margin: const EdgeInsets.only(top: 20),
            borderColor: Color(0XFFB4D8D8),
            buttonColor: Color(0XFFE9F3F4),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            textColor: Color(0XFF635F75),
            title: 'Adicionar um cartão',
            onPressed: () {
              Navigator.of(context).pushNamed('/services-purchase/new-credit-card', arguments: {
                'paymentStore': paymentStore,
              }).then((value) {
                setState(() {});
              });
            },
          ),
          AppButton(
            margin: const EdgeInsets.only(top: 20),
            borderColor: Color(0XFFB4D8D8),
            buttonColor: Color(0XFFE9F3F4),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            textColor: Color(0XFF635F75),
            title: 'Excluir um cartão',
            onPressed: () {
              Navigator.of(context).pushNamed('/products/products_purchase/delete_payment_method', arguments: {
                'paymentStore': paymentStore,
              });
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Se desejar parcelar, escolha o número de parcelas, se for à vista basta continuar',
                    textAlign: TextAlign.center,
                    style: customTextStyle(FontWeight.w600, 18, Color(0XFF4D0351), letterSpacing: -0.3),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 335,
            margin: const EdgeInsets.only(top: 15),
            child: Stack(
              children: [
                Container(
                  height: 305,
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(180, 216, 216, 0.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color.fromRGBO(99, 95, 117, 0.2)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Parcelas',
                              textAlign: TextAlign.center,
                              style: customTextStyle(FontWeight.bold, 18, Color(0XFF4D0351)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Observer(builder: (_) {
                      return SelectAmountComponent(
                        installments: paymentStore.formatInstallment(),
                        onTapDecrease: paymentStore.decreaseInstallment,
                        onTapIncrease: paymentStore.increaseInstallment,
                      );
                    }),
                    Observer(builder: (_) {
                      return RichText(
                        text: TextSpan(
                          text: paymentStore.setInstallmentTextInPlural(),
                          style: customTextStyle(FontWeight.bold, 23, Color(0XFF4D0351)),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' R\$ ${paymentStore.getInstallmentAmount.toStringAsFixed(2)}',
                                style: customTextStyle(FontWeight.w800, 30, Color(0XFF4D0351)))
                          ],
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      if (paymentStore.paymentMethod.number != 'Selecione um cartão') {
                        return Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset(paymentStore.paymentMethod.imagePath!),
                              ),
                              SizedBox(width: 15),
                              Text(
                                '${paymentStore.paymentMethod.brandName} ****${paymentStore.paymentMethod.number!.substring(paymentStore.paymentMethod.number!.length - 4, paymentStore.paymentMethod.number!.length)}',
                                style: customTextStyle(FontWeight.w600, 18, Color(0XFF635F75)),
                              )
                            ],
                          ),
                        );
                      }
                      return Container();
                    })
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 30),
                        child: Observer(builder: (_) {
                          return AppButton(
                            borderColor: paymentStore.enableButton ? Color(0XFF006633) : Colors.grey,
                            buttonColor: Color(0XFF22AB86),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            textColor: Color(0XFFFFFFFF),
                            title: 'Continuar',
                            onPressed: paymentStore.enableButton
                                ? () {
                                    servicePurchaseRequestModel.paymentMethodEntity = PaymentMethodEntity(
                                      id: 1,
                                      installments: paymentStore.installment,
                                      name: paymentStore.paymentMethod.number!.substring(
                                          paymentStore.paymentMethod.number!.length - 4,
                                          paymentStore.paymentMethod.number!.length),
                                      installmentAmount: paymentStore.getInstallmentAmount,
                                    );
                                    Navigator.of(context)
                                        .pushNamed('/services-purchase/service-purchase-details', arguments: {
                                      'servicePurchaseRequestModel': servicePurchaseRequestModel,
                                    });
                                  }
                                : null,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
