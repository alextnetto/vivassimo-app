import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';

class ProductAnnouncementReviewScreen extends StatefulWidget {
  final List img;
  const ProductAnnouncementReviewScreen({Key? key, required this.img}) : super(key: key);

  @override
  _ProductAnnouncementReviewScreenState createState() => _ProductAnnouncementReviewScreenState();
}

class _ProductAnnouncementReviewScreenState extends State<ProductAnnouncementReviewScreen> {
  var controller1 = TextEditingController();

  var controller2 = TextEditingController();

  var controller3 = TextEditingController();

  var controller4 = TextEditingController();

  var controller5 = TextEditingController();

  var controller6 = TextEditingController();

  String enteredText = '';

  get hgt => widget.img.length;

  double calculateHeight() {
    if (hgt == 0) {
      return 200.0;
    } else if (hgt == 1 || hgt == 2) {
      return 360.0;
    } else if (hgt == 3 || hgt == 4) {
      return 250.0;
    } else if (hgt == 5 || hgt == 6) {
      return 400.0;
    } else if (hgt == 6 || hgt == 7) {
      return 500.0;
    }
    return 360.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              margin: EdgeInsets.fromLTRB(45, 0, 45, 0),
              // height: calculateHeight(),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.img.length,
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
                            image: FileImage(File(widget.img[index])),
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
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 0, bottom: 10),
                height: 60,
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
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {
                      setState(() {
                        enteredText = value;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF635F75),
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
                    controller: controller1,
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
                    Text('Preço (R\$)',
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
                height: 60,
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
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {
                      setState(() {
                        enteredText = value;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF635F75),
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
                    controller: controller2,
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
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {
                      setState(() {
                        enteredText = value;
                      });
                    },
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
                    controller: controller3,
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
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 0, bottom: 10),
                height: 60,
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
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {
                      setState(() {
                        enteredText = value;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF635F75),
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
                    controller: controller4,
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
                    Text('Forma de Envio',
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
                height: 60,
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
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {
                      setState(() {
                        enteredText = value;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF635F75),
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
                    controller: controller5,
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
                    Text('Contribuição',
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
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF635F75)),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    readOnly: true,
                    maxLines: 2000,
                    maxLength: 2000,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {
                      setState(() {
                        enteredText = value;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF635F75),
                        ),
                        counter: Offstage(),
                        contentPadding: EdgeInsets.only(right: 0, left: 0, bottom: 0),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none),
                    cursorColor: Color(0xFF635F75),
                    style: TextStyle(
                        // fontFamily: 'Manrope',
                        color: Color(0xFFFF0000),
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.end,
                    controller: controller6,
                  ),
                ),
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
                  Navigator.of(context).pushNamed('/product/products_announcement/produc_announcement_success',
                      arguments: {'img': widget.img});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
