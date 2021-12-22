import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/features/products_announcement/infra/models/product_announcement_request_model.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_description_store.dart';

class ProductAnnouncementDescriptionScreen extends StatefulWidget {
  final ProductAnnouncementRequestModel productAnnouncementRequestModel;
  const ProductAnnouncementDescriptionScreen({Key? key, required this.productAnnouncementRequestModel})
      : super(key: key);

  @override
  _ProductAnnouncementDescriptionScreenState createState() => _ProductAnnouncementDescriptionScreenState();
}

class _ProductAnnouncementDescriptionScreenState extends State<ProductAnnouncementDescriptionScreen> {
  ProductAnnouncementRequestModel get productModel => widget.productAnnouncementRequestModel;
  ProductDescriptionStore productStore = Modular.get<ProductDescriptionStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Anunciar'),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressBar(textIndicator: '4/8', percentageValue: 0.5),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Descreva o seu produto',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.defaultTextStyleTitleBig,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 46, top: 45),
              child: Container(
                width: 324,
                height: 447,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF4D0351)),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                // child: AppTextField(
                //   label: '',
                //   maxLength: 2000,
                //   maxLines: 2000,
                //   maxLengthEnforcement: MaxLengthEnforcement.enforced,
                // )
                child: TextField(
                  maxLines: 2000,
                  maxLength: 2000,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  onChanged: productStore.setProductDescription,
                  decoration: InputDecoration(
                    counter: Offstage(),
                    contentPadding: EdgeInsets.only(right: 25, left: 25, top: 25),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorText: productStore.getProductDescriptionError,
                  ),
                  cursorColor: Color(0xFF4D0351),
                  style: TextStyle(
                      fontFamily: 'Manrope', color: Color(0xFF4D0351), fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, top: 15, left: 268),
              child: Column(
                children: [
                  SizedBox(
                    width: 84,
                    height: 25,
                    child: Observer(builder: (context) {
                      return Text(
                        '${productStore.productDescription.length.toString()}/2000',
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'Manrope', fontWeight: FontWeight.w900, color: Color(0xFF4D0351)),
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return SizedBox(
                child: Observer(builder: (_) {
                  return ButtonConfirm(
                    label: 'Continuar',
                    primary: VivassimoTheme.green,
                    textColor: VivassimoTheme.white,
                    borderColor: productStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
                    onPressed: productStore.enableButton
                        ? () {
                            productModel.productDescription = productStore.productDescription;

                            Navigator.of(context)
                                .pushNamed('/product/products_announcement/product_photos', arguments: {
                              'productAnnouncementRequestModel': productModel,
                            });
                          }
                        : null,
                  );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
