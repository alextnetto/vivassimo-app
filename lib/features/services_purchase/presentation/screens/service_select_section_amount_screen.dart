import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/entities/service_entity.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/components/select_installments_component.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'package:my_app/features/products_purchase/infra/models/request/service_purchase_request_model.dart';
import 'package:my_app/features/services_purchase/presentation/stores/service_select_section_amount_store.dart';

class ServiceSelectSectionAmountScreen extends StatefulWidget {
  final ServicePurchaseRequestModel servicePurchaseRequestModel;
  const ServiceSelectSectionAmountScreen({Key? key, required this.servicePurchaseRequestModel}) : super(key: key);

  @override
  _ServiceSelectSectionAmountScreenState createState() => _ServiceSelectSectionAmountScreenState();
}

class _ServiceSelectSectionAmountScreenState extends State<ServiceSelectSectionAmountScreen> {
  ServicePurchaseRequestModel get servicePurchaseRequestModel => widget.servicePurchaseRequestModel;
  ServiceEntity get serviceEntity => servicePurchaseRequestModel.serviceEntity!;
  ServiceSelectSectionAmountStore serviceStore = Modular.get<ServiceSelectSectionAmountStore>();

  @override
  void initState() {
    serviceStore.setServiceValue(serviceEntity.value ?? 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              // height: 120,
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
                  LinearProgressBar(textIndicator: '1/3', percentageValue: 0.33),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(top: 20),
              width: 150,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${serviceEntity.description} (Sessão de ${serviceEntity.sessionDuration})',
                      // 'Pilates Clássico com acompanhamento individual (Sessão de 1 Hora)',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.defaultTextStyleTitleSmall600,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverToBoxAdapter(
            child: Container(
              height: 305,
              margin: const EdgeInsets.only(left: 22, right: 22),
              padding: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(180, 216, 216, 0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color.fromRGBO(99, 95, 117, 0.2))),
              child: Column(
                children: [
                  Text('Quantas sessões deseja?', style: AppTextStyles.defaultTextStyleTitleMiddleBold),
                  Observer(builder: (_) {
                    return SelectAmountComponent(
                      installments: serviceStore.formatSessionsAmount,
                      onTapDecrease: serviceStore.decreaseInstallment,
                      onTapIncrease: serviceStore.increaseInstallment,
                    );
                  }),
                  Container(
                    margin: const EdgeInsets.only(top: 25, left: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valor total',
                          style: AppTextStyles.defaultTextStyleDescriptionGreyBold,
                        ),
                        Observer(builder: (_) {
                          return Text(
                            serviceStore.getSessionsAmountValue,
                            style: customTextStyle(FontWeight.w800, 30, Color(0XFF560955)),
                          );
                        }),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Observer(builder: (_) {
                                return Text(
                                  'ou em até ${servicePurchaseRequestModel.maxInstallments}x sem juros de R\$ ${serviceStore.getInstallmentsAmountValue}',
                                  style: customTextStyle(FontWeight.bold, 18, Color(0XFF635F75), letterSpacing: -1.1),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 60)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              // margin: const EdgeInsets.only(top: 66),
              child: ButtonConfirm(
                label: 'Continuar',
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  executeServiceAction() {
    servicePurchaseRequestModel.amountSessions = serviceStore.amountSessions;
    servicePurchaseRequestModel.totalPurchase = serviceStore.amountSessions * serviceEntity.value!;

    Navigator.of(context).pushNamed('/services-purchase/payment-method-service', arguments: {
      'servicePurchaseRequestModel': servicePurchaseRequestModel,
    });
  }
}
