import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/entities/credit_card_entity.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/payment_method_store.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/modal_bottom_sheet_delete_component.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_button.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/delete_payment_method_store.dart';

class DeletePaymentMethodScreen extends StatefulWidget {
  final PaymentMethodStore paymentStore;
  const DeletePaymentMethodScreen({Key? key, required this.paymentStore}) : super(key: key);

  @override
  _DeletePaymentMethodScreenState createState() => _DeletePaymentMethodScreenState();
}

class _DeletePaymentMethodScreenState extends State<DeletePaymentMethodScreen> {
  PaymentMethodStore get paymentStore => widget.paymentStore;
  List<CreditCardEntity> get creditCards => paymentStore.creditCardEntities;
  DeletePaymentMethodStore deletePaymentStore = Modular.get<DeletePaymentMethodStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              AppBarDefaultWidget(title: 'Meus cartões'),
              Container(
                margin: const EdgeInsets.only(top: 42),
                width: 220,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Qual cartão deseja excluir?',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.defaultTextStyleTitleBig800,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 40),
                  margin: const EdgeInsets.only(top: 35),
                  child: Observer(
                    builder: (_) {
                      return Column(
                        children: [
                          for (int index = 1; index < creditCards.length; index++)
                            Observer(builder: (_) {
                              return GestureDetector(
                                onTap: () {
                                  deletePaymentStore.setPaymentMethodId(1);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: AppButton(
                                    borderColor: Color(0XFFDE674B),
                                    buttonColor: Color(0XFFFF3300),
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    textColor: Color(0XFFFFFFFF),
                                    title: AppHelpers.formatItemToDropDown(creditCards[index].number ?? ''),
                                    onPressed: () {
                                      ModalBottomSheetDeleteComponentWidget.showModalDeleteComponent(
                                        context: context,
                                        cancelButtomText: 'Cancelar',
                                        onPressedCancel: Navigator.of(context).pop,
                                        confirmButtomText: 'Sim, excluir este cartão',
                                        onPressedConfirm: () {
                                          paymentStore.removeCreditCard(creditCards[index]);
                                          Navigator.of(context).pop();
                                        },
                                        deleteMessage:
                                            'Deseja excluir \n o ${AppHelpers.formatItemToDropDown(creditCards[index].number ?? '')}',
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                        ],
                      );
                    },
                  )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: ButtonConfirm(
        label: 'Cancelar',
        primary: Color(0XFFFFB640),
        textColor: Color(0XFF4D0351),
        borderColor: Color(0XFFDE674B),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
