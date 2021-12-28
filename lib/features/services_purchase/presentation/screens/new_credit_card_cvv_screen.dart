import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/entities/credit_card_entity.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/features/services_purchase/presentation/stores/new_credit_card_cvv_store.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/new_credit_card_store.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/payment_method_store.dart';

class NewCreditCardCvvScreen extends StatefulWidget {
  final PaymentMethodStore paymentStore;
  final NewCreditCardStore creditCardStore;

  const NewCreditCardCvvScreen({Key? key, required this.paymentStore, required this.creditCardStore}) : super(key: key);

  @override
  _NewCreditCardCvvScreenState createState() => _NewCreditCardCvvScreenState();
}

class _NewCreditCardCvvScreenState extends State<NewCreditCardCvvScreen> {
  PaymentMethodStore get paymentStore => widget.paymentStore;
  NewCreditCardStore get creditCardStore => widget.creditCardStore;
  NewCreditCardCvvStore creditCardCvvStore = Modular.get<NewCreditCardCvvStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 111,
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
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 46, right: 46),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Digite o CVV',
                        style: AppTextStyles.defaultTextStyleTitleBig800,
                      ),
                      Image.asset('assets/icon/question_mark_btn.png')
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: AppTextField(
                      label: 'CVV',
                      onChanged: creditCardCvvStore.setNumber,
                      errorText: creditCardCvvStore.getNumberError,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              child: Observer(builder: (_) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonConfirm(
                    label: 'Continuar',
                    primary: VivassimoTheme.green,
                    textColor: VivassimoTheme.white,
                    borderColor: creditCardCvvStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
                    onPressed: creditCardCvvStore.enableButton
                        ? () {
                            paymentStore.addCreditCard(CreditCardEntity(
                              id: paymentStore.creditCardEntities.length + 1,
                              number: creditCardStore.number,
                              brand: creditCardStore.cardBrand,
                            ));

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          }
                        : null,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
