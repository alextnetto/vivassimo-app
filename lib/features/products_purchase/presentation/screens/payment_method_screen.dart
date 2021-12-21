import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_button.dart';
import 'package:my_app/core/ui/widgets/app_dropdown_list.dart';
import 'package:my_app/features/products_purchase/domain/entities/payment_method_entity.dart';
import 'package:my_app/features/products_purchase/infra/models/request/product_purchase_request_model.dart';
import 'package:my_app/features/products_purchase/presentation/stores/payment_method_store.dart';

class PaymentMethodScreen extends StatefulWidget {
  final ProductPurchaseRequestModel productPurchaseRequestModel;

  const PaymentMethodScreen({Key? key, required this.productPurchaseRequestModel}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  ProductPurchaseRequestModel get productPurchaseRequestModel => widget.productPurchaseRequestModel;
  PaymentMethodStore paymentStore = Modular.get<PaymentMethodStore>();

  @override
  void initState() {
    paymentStore.setPurchaseValue(productPurchaseRequestModel.totalPurchase!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          Container(
            height: 131,
            padding: const EdgeInsets.only(top: 25),
            decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
            child: Column(
              children: const [
                AppBarDefaultWidget(title: 'Pagamento'),
                SizedBox(
                  height: 10,
                ),
                LinearProgressBar(textIndicator: '3/4', percentageValue: 0.75),
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
              child: DropdownListWidget(
                contentList: paymentStore.creditCards,
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
                  paymentStore.setPaymentMethod(value ?? '');
                },
                storeValue: paymentStore.paymentMethod,
              ),
            );
          }),
          AppButton(
            borderColor: Color(0XFFB4D8D8),
            buttonColor: Color(0XFFE9F3F4),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            textColor: Color(0XFF635F75),
            title: 'Excluir um cartão',
            onPressed: () {
              Navigator.of(context).pushNamed('/products/products_purchase/delete_payment_method');
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
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 8, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0XFF635F75)),
                              color: Colors.white,
                            ),
                            height: 47,
                            width: 246,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Observer(
                                    builder: (_) {
                                      return Text(
                                        paymentStore.formatInstallment(),
                                        textAlign: TextAlign.center,
                                        style: customTextStyle(FontWeight.w800, 30, Color(0XFF4D0351)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: GestureDetector(
                              child: Image.asset('assets/icon/minus_button.png'),
                              onTap: () {
                                paymentStore.decreaseInstallment();
                              },
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: SizedBox(
                              child: GestureDetector(
                                child: Image.asset('assets/icon/plus_button.png'),
                                onTap: () {
                                  paymentStore.increaseInstallment();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      if (paymentStore.paymentMethod != 'Selecione um cartão') {
                        return Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset('assets/icon/mastercard.png'),
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Matercard ****${paymentStore.paymentMethod.substring(paymentStore.paymentMethod.length - 4, paymentStore.paymentMethod.length)}',
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
                                    productPurchaseRequestModel.paymentMethodEntity = PaymentMethodEntity(
                                      id: 1,
                                      installments: paymentStore.installment,
                                      name: paymentStore.paymentMethod.substring(
                                          paymentStore.paymentMethod.length - 4, paymentStore.paymentMethod.length),
                                      installmentAmount: paymentStore.getInstallmentAmount,
                                    );
                                    Navigator.of(context)
                                        .pushNamed('/products/products_purchase/product_purchase_details', arguments: {
                                      'productPurchaseRequestModel': productPurchaseRequestModel,
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
