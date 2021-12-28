import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/formatters/currency_pt_br_input_formatter.dart';
import 'package:my_app/features/products_announcement/infra/models/product_announcement_request_model.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_value_store.dart';

class ProductValueScreen extends StatefulWidget {
  final ProductAnnouncementRequestModel productAnnouncementRequestModel;

  const ProductValueScreen({Key? key, required this.productAnnouncementRequestModel}) : super(key: key);
  @override
  _ProductValueScreenState createState() => _ProductValueScreenState();
}

class _ProductValueScreenState extends State<ProductValueScreen> {
  ProductAnnouncementRequestModel get productModel => widget.productAnnouncementRequestModel;
  ProductValueStore productStore = Modular.get<ProductValueStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          // height: 120,
                          // padding: const EdgeInsets.only(top: 25),
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top,
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(180, 216, 216, 0.2),
                            border: Border(bottom: BorderSide(color: Color.fromRGBO(99, 95, 117, 0.2))),
                          ),
                          child: Column(
                            children: const [
                              AppBarDefaultWidget(title: 'Anunciar'),
                              SizedBox(height: 10),
                              LinearProgressBar(textIndicator: '6/8', percentageValue: 0.75),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Qual o valor do produto?',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.defaultTextStyleTitleBig,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 46, right: 43, left: 53),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 13),
                                child: Text(
                                  'RS',
                                  style: TextStyle(color: Color(0xFF4D0351), fontSize: 26, fontWeight: FontWeight.w800),
                                ),
                              ),
                              Expanded(
                                child: Observer(builder: (_) {
                                  return AppTextField(
                                    keyBoardType: TextInputType.number,
                                    textAlign: TextAlign.end,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CurrencyPtBrInputFormatter(
                                        maxDigits: 8,
                                      ),
                                    ],
                                    // controller: newAddressStore.cepController,
                                    onChanged: productStore.setProductValueString,
                                    label: 'Insirar o valor',
                                    errorText: productStore.getProductValueError,
                                    // inputFormatters: [AppMasks.cep],
                                    // errorText: newAddressStore.getCepError,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned.fill(
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(top: 18),
                        child: Observer(builder: (_) {
                          return ButtonConfirm(
                            label: 'Continuar',
                            primary: VivassimoTheme.green,
                            textColor: VivassimoTheme.white,
                            borderColor: productStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
                            onPressed: productStore.enableButton
                                ? () {
                                    productModel.productValue = productStore.productValue;

                                    Navigator.of(context)
                                        .pushNamed('/product/products_announcement/product_delivery_type', arguments: {
                                      'productAnnouncementRequestModel': productModel,
                                    });
                                  }
                                : null,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
