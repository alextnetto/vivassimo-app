import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';

class ProductPurchaseDetailsScreen extends StatefulWidget {
  const ProductPurchaseDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductPurchaseDetailsScreenState createState() => _ProductPurchaseDetailsScreenState();
}

class _ProductPurchaseDetailsScreenState extends State<ProductPurchaseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
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
          Container(
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
          Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.only(top: 22, left: 22, right: 22),
            decoration: BoxDecoration(
              color: Color.fromRGBO(180, 216, 216, 0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bolo Caseiro de Chocolate', style: AppTextStyles.defaultTextStyleTitleMiddleBold),
                Text(
                  'Vendido e Entregue por Glória Maria',
                  style: AppTextStyles.defaultTextStyleTitleSmall600,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('R\$ 29,90', style: AppTextStyles.defaultTextStyleTitleSmall600),
                      RichText(
                        text: TextSpan(
                          text: 'Entrega via PAC:',
                          style: AppTextStyles.defaultTextStyleTitleSmall600,
                          children: <TextSpan>[
                            TextSpan(text: ' Grátis', style: customTextStyle(FontWeight.w600, 18, Color(0XFF22AB86)))
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Total: R\$ 29,90',
                        style: AppTextStyles.defaultTextStyleTitleSmall600,
                      ),
                      Text(
                        '1 Parcela de R\$ 29,90',
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
                              child: Image.asset('assets/icon/mastercard.png'),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Matercard ****4555',
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
                        'Av. Paulista, 930',
                        style: AppTextStyles.defaultTextStyleTitleSmall600,
                      ),
                      Text(
                        'Centro - São Paulo/SP',
                        style: AppTextStyles.defaultTextStyleTitleSmall600,
                      ),
                      Text(
                        'CEP: 064.65-134',
                        style: AppTextStyles.defaultTextStyleTitleSmall600,
                      ),
                      Text(
                        'Em frente a farmácia',
                        style: AppTextStyles.defaultTextStyleTitleSmall600,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        // margin: const EdgeInsets.only(top: 66),
        child: Observer(builder: (_) {
          return ButtonConfirm(
            label: 'Continuar',
            primary: VivassimoTheme.green,
            onPrimary: VivassimoTheme.white,
            borderColor: VivassimoTheme.greenBorderColor,
            onPressed: () {
              Navigator.of(context).pushNamed('/products/products_purchase/product_purchase_success');
            },
          );
        }),
      ),
    );
  }
}
