import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/core/entities/delivery_address_entity.dart';
import 'package:my_app/core/entities/product_entity.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'package:my_app/features/products_purchase/domain/entities/payment_method_entity.dart';
import 'package:my_app/features/products_purchase/domain/entities/shipping_method_entity.dart';
import 'package:my_app/features/products_purchase/infra/models/request/product_purchase_request_model.dart';

class ProductPurchaseDetailsScreen extends StatefulWidget {
  final ProductPurchaseRequestModel productPurchaseRequestModel;

  const ProductPurchaseDetailsScreen({Key? key, required this.productPurchaseRequestModel}) : super(key: key);

  @override
  _ProductPurchaseDetailsScreenState createState() => _ProductPurchaseDetailsScreenState();
}

class _ProductPurchaseDetailsScreenState extends State<ProductPurchaseDetailsScreen> {
  ProductPurchaseRequestModel get productPurchaseRequestModel => widget.productPurchaseRequestModel;
  ProductEntity get productEntity => productPurchaseRequestModel.productEntity!;
  AddressEntity get addressEntity => productPurchaseRequestModel.deliveryAddressEntity!;
  ShippingMethodEntity get shippingEntity => productPurchaseRequestModel.shippingMethodEntity!;
  PaymentMethodEntity get paymentEntity => productPurchaseRequestModel.paymentMethodEntity!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 131,
              padding: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Revise sua compra'),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressBar(textIndicator: '4/4', percentageValue: 1),
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
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.only(top: 22, left: 22, right: 22),
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 216, 216, 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productPurchaseRequestModel.productEntity!.name ?? '',
                      style: AppTextStyles.defaultTextStyleTitleMiddleBold),
                  Text(
                    'Vendido e Entregue por ${productEntity.ownerName}',
                    style: AppTextStyles.defaultTextStyleTitleSmall600,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('R\$ ${productEntity.value!.toStringAsFixed(2)}',
                            style: AppTextStyles.defaultTextStyleTitleSmall600),
                        RichText(
                          text: TextSpan(
                            text: 'Entrega via ${shippingEntity.name}:',
                            style: AppTextStyles.defaultTextStyleTitleSmall600,
                            children: <TextSpan>[
                              TextSpan(
                                  text: shippingEntity.value! > 0
                                      ? ' R\$ ${shippingEntity.value!.toStringAsFixed(2)}'
                                      : ' Grátis',
                                  style: customTextStyle(FontWeight.w600, 18, Color(0XFF22AB86)))
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Total: R\$ ${(productEntity.value! + shippingEntity.value!).toStringAsFixed(2)}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Text(
                          paymentEntity.installments! > 1
                              ? '${paymentEntity.installments!} Parcelas de R\$ ${paymentEntity.installmentAmount!.toStringAsFixed(2)}'
                              : '1 Parcela de R\$ ${productPurchaseRequestModel.totalPurchase!.toStringAsFixed(2)}',
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
                        SizedBox(height: 20),
                        Text(
                          'Endereço de Entrega',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Text(
                          '${addressEntity.street}, ${addressEntity.number}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Text(
                          '${addressEntity.neighborhood} - ${addressEntity.city}/${addressEntity.state}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Text(
                          'CEP: ${addressEntity.zipCode}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                        ),
                        Text(
                          '${addressEntity.complement}',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
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
                  label: 'Continuar',
                  primary: VivassimoTheme.green,
                  textColor: VivassimoTheme.white,
                  borderColor: VivassimoTheme.greenBorderColor,
                  onPressed: () {
                    if (AppHelpers.isInternetActive) {
                      executePurchaseDetailsAction();
                    } else {
                      Navigator.of(context).pushNamed('/internet-connection', arguments: {
                        'executeAction': executePurchaseDetailsAction,
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

  executePurchaseDetailsAction() {
    Navigator.of(context).pushNamed('/products/products_purchase/product_purchase_success');
  }
}
