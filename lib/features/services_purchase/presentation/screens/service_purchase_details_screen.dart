import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/core/entities/service_entity.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'package:my_app/features/products_purchase/domain/entities/payment_method_entity.dart';
import 'package:my_app/features/products_purchase/infra/models/request/service_purchase_request_model.dart';

class ServicePurchaseDetailsScreen extends StatefulWidget {
  final ServicePurchaseRequestModel servicePurchaseRequestModel;

  const ServicePurchaseDetailsScreen({Key? key, required this.servicePurchaseRequestModel}) : super(key: key);

  @override
  ServicePurchaseDetailsScreenState createState() => ServicePurchaseDetailsScreenState();
}

class ServicePurchaseDetailsScreenState extends State<ServicePurchaseDetailsScreen> {
  ServicePurchaseRequestModel get servicePurchaseRequestModel => widget.servicePurchaseRequestModel;
  ServiceEntity get serviceEntity => servicePurchaseRequestModel.serviceEntity!;
  PaymentMethodEntity get paymentEntity => servicePurchaseRequestModel.paymentMethodEntity!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              // height: 131,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 216, 216, 0.2),
                border: Border(bottom: BorderSide(color: Color.fromRGBO(99, 95, 117, 0.2))),
              ),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Revise sua compra'),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressBar(textIndicator: '3/3', percentageValue: 1),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Glória, revise sua compra, se estiver tudo certo, confirme o pagamento',
                      textAlign: TextAlign.center,
                      style: customTextStyle(FontWeight.w600, 18, Color(0XFF4D0351), letterSpacing: -0.3),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 51),
              margin: const EdgeInsets.only(top: 22, left: 22, right: 22),
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 216, 216, 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(servicePurchaseRequestModel.serviceEntity!.description ?? '',
                      style: AppTextStyles.defaultTextStyleTitle),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Color(0xff4D0351))),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'R\$ ${serviceEntity.value!.toStringAsFixed(2)}/Hora',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Text(
                          'Quantidade: ${servicePurchaseRequestModel.amountSessions}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Total: R\$ ${(servicePurchaseRequestModel.totalPurchase!).toStringAsFixed(2)}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Text(
                          paymentEntity.installments! > 1
                              ? '${paymentEntity.installments!} Parcelas de R\$ ${paymentEntity.installmentAmount!.toStringAsFixed(2)}'
                              : '1 Parcela de R\$ ${servicePurchaseRequestModel.totalPurchase!.toStringAsFixed(2)}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'FORMA DE PAGAMENTO:',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Image.asset(paymentEntity.imagePath ?? ''),
                              ),
                              SizedBox(width: 15),
                              Text(
                                '${paymentEntity.brandName} ****${paymentEntity.name}',
                                style: AppTextStyles.defaultTextStyleTitleSmall600,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              // margin: const EdgeInsets.only(top: 66),
              child: Observer(builder: (_) {
                return ButtonConfirm(
                  label: 'Confirmar pagamento',
                  primary: VivassimoTheme.green,
                  textColor: VivassimoTheme.white,
                  borderColor: VivassimoTheme.greenBorderColor,
                  onPressed: () {
                    if (AppHelpers.isInternetActive) {
                      executeServiceAction();
                    } else {
                      Navigator.of(context).pushNamed('/internet-connection', arguments: {
                        'executeAction': executeServiceAction,
                      });
                    }
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  executeServiceAction() {
    Navigator.of(context).pushNamed('/products/products_purchase/product_purchase_success');
  }
}
