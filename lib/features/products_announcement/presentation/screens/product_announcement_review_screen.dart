import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/formatters/currency_pt_br_input_formatter.dart';
import 'package:my_app/features/products_announcement/infra/models/product_announcement_request_model.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_review_store.dart';

class ProductAnnouncementReviewScreen extends StatefulWidget {
  final ProductAnnouncementRequestModel productAnnouncementRequestModel;
  const ProductAnnouncementReviewScreen({Key? key, required this.productAnnouncementRequestModel}) : super(key: key);

  @override
  _ProductAnnouncementReviewScreenState createState() => _ProductAnnouncementReviewScreenState();
}

class _ProductAnnouncementReviewScreenState extends State<ProductAnnouncementReviewScreen> {
  ProductAnnouncementRequestModel get productModel => widget.productAnnouncementRequestModel;
  var titleController = TextEditingController();
  var valueController = TextEditingController();
  var descriptionController = TextEditingController();
  var conditionController = TextEditingController();
  var deliveryTypeController = TextEditingController();
  var contributionController = TextEditingController();
  ProductAnnouncementReviewStore productStore = Modular.get<ProductAnnouncementReviewStore>();

  @override
  void initState() {
    setValuesToFields();
    super.initState();
  }

  setValuesToFields() {
    titleController.text = productModel.productName!;
    valueController.text = productStore.formatToReal(productModel.productValue!);
    descriptionController.text = productModel.productDescription!;
    conditionController.text = productModel.productCondition!;
    deliveryTypeController.text =
        productModel.isToSendByCorreios ? 'Enviar pelos Correios' : 'Combinar com o comprador';
    contributionController.text = productStore.calculateContributionText(productModel.productValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 120,
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
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressBar(textIndicator: '8/8', percentageValue: 1),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Revise e anuncie',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.defaultTextStyleTitleBig,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Fotos',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Container(
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              margin: EdgeInsets.fromLTRB(45, 0, 45, 0),
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: productModel.productImages!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.5,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Material(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(File(productModel.productImages![index])),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Título',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 45, right: 45),
              child: AppTextField(
                label: '',
                readOnly: true,
                controller: titleController,
                suffixIcon: Icon(Icons.arrow_forward, color: Color(0xff635F75)),
                borderColor: Color(0xff635F75),
                textColor: Color(0xff635F75),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Preço (R\$)',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 45, right: 45),
              child: AppTextField(
                label: '',
                readOnly: true,
                controller: valueController,
                suffixIcon: Icon(Icons.arrow_forward, color: Color(0xff635F75)),
                borderColor: Color(0xff635F75),
                textColor: Color(0xff635F75),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyPtBrInputFormatter(
                    maxDigits: 8,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Descrição',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 45, right: 45),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 0, bottom: 10),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF635F75)),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLines: 2000,
                    maxLength: 2000,
                    readOnly: true,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        prefix: Padding(
                          padding: const EdgeInsets.only(top: 8, right: 10),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF635F75),
                          ),
                        ),
                        counter: Offstage(),
                        contentPadding: EdgeInsets.only(right: 0, left: 0, bottom: 0),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none),
                    cursorColor: Color(0xFF635F75),
                    style: TextStyle(
                        // fontFamily: 'Manrope',
                        color: Color(0xFF635F75),
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.end,
                    controller: descriptionController,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Condição',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 45, right: 45),
              child: AppTextField(
                label: '',
                readOnly: true,
                controller: conditionController,
                suffixIcon: Icon(Icons.arrow_forward, color: Color(0xff635F75)),
                borderColor: Color(0xff635F75),
                textColor: Color(0xff635F75),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Forma de Envio',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 45, right: 45),
              child: AppTextField(
                label: '',
                readOnly: true,
                controller: deliveryTypeController,
                suffixIcon: Icon(Icons.arrow_forward, color: Color(0xff635F75)),
                borderColor: Color(0xff635F75),
                textColor: Color(0xff635F75),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Contribuição',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 45, right: 45),
              child: AppTextField(
                label: '',
                readOnly: true,
                controller: contributionController,
                // suffixIcon: Icon(Icons.arrow_forward, color: Color(0xff635F75)),
                borderColor: Color(0xff635F75),
                textColor: Color(0xffDE674B),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ButtonConfirm(
                label: 'Anunciar',
                primary: Color(0xFF22AB86),
                textColor: Color(0xFFFFFFFF),
                borderColor: Color(0xFF006633),
                onPressed: () {
                  Navigator.of(context).pushNamed('/product/products_announcement/product_announcement_success',
                      arguments: {'imagePath': productModel.productImages![0]});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
