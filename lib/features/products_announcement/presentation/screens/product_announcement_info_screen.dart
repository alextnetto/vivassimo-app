import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/features/products_announcement/infra/models/product_announcement_request_model.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_info_store.dart';

class ProductAnnouncementInfoScreen extends StatefulWidget {
  // final CategoryAnnouncementEntity categoryEntity;
  final ProductAnnouncementRequestModel productAnnouncementRequestModel;

  const ProductAnnouncementInfoScreen({Key? key, required this.productAnnouncementRequestModel}) : super(key: key);

  @override
  _ProductAnnouncementInfoScreenState createState() => _ProductAnnouncementInfoScreenState();
}

class _ProductAnnouncementInfoScreenState extends State<ProductAnnouncementInfoScreen> {
  ProductAnnouncementRequestModel get productModel => widget.productAnnouncementRequestModel;
  ProducAnnouncementInfoStore productStore = Modular.get<ProducAnnouncementInfoStore>();
  // TextEditingController? _controller;

  @override
  void initState() {
    // _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
            child: Column(
              children: const [
                AppBarDefaultWidget(title: 'Anunciar'),
                SizedBox(
                  height: 10,
                ),
                LinearProgressBar(textIndicator: '2/8', percentageValue: 0.25),
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
                    'Informe o nome do produto,marca e modelo',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.defaultTextStyleTitleBig,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 46, left: 46, top: 46),
            child: AppTextField(
              textAlign: TextAlign.center,
              onChanged: productStore.setProductName,
              label: 'Nome do produto',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 16),
            child: SizedBox(
              width: 314,
              height: 20,
              child: Text(
                "Evite incluir condições de venda",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF635F75), fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Observer(builder: (_) {
                        return ButtonConfirm(
                          label: 'Continuar',
                          primary: Color(0xFF22AB86),
                          textColor: Color(0xFFFFFFFF),
                          borderColor: productStore.enableButton ? Color(0xFF006633) : Colors.grey,
                          onPressed: productStore.enableButton
                              ? () {
                                  productModel.productName = productStore.productName;

                                  Navigator.of(context)
                                      .pushNamed('/product/products_announcement/product_new_or_used', arguments: {
                                    'productAnnouncementRequestModel': productModel,
                                  });
                                }
                              : null,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
