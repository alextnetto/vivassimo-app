import 'package:flutter/material.dart';
import 'package:my_app/features/products/products_announcement/presentation/PageUtils/AppStrings.dart';
import 'package:my_app/features/products/products_announcement/presentation/PageUtils/custom_check_box.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/review_ad_screen.dart';

class ProductDeliveryScreen extends StatefulWidget {
  final List img;
  ProductDeliveryScreen({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  _ProductDeliveryScreenState createState() => _ProductDeliveryScreenState();
}

class _ProductDeliveryScreenState extends State<ProductDeliveryScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140,
              color: Color.fromRGBO(180, 216, 216, 0.2),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              alignment: AlignmentDirectional.center,
                              primary: Color(0xFF4D0351),
                              fixedSize: Size(140, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(right: Radius.circular(10)))),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_back_sharp),
                              SizedBox(width: 10),
                              Text(
                                "Voltar",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(AppStrings.ANUNCIAR,
                                style:
                                    TextStyle(color: Color(0xFF4D0351), fontSize: 18.0, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.fromBorderSide(
                                  BorderSide(width: 3.0, style: BorderStyle.solid, color: Color(0xFF4D0351))),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          width: 266,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              minHeight: 10,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF22AB86)),
                              value: 0.875,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '7/8',
                          style: TextStyle(
                              color: Color(0xFF4D0351),
                              fontSize: 18,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21, right: 46, left: 46),
              child: SizedBox(
                child: Text(
                  'Como você quer entregar o seu produto?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF4D0351), fontSize: 26, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 46, right: 45),
              child: Container(
                height: 130,
                decoration: BoxDecoration(color: Color(0xFF22AB86), borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 40, 20, 40),
                      height: 60,
                      width: 178,
                      child: Text(
                        "Enviar pelos Correios",
                        style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Custom_Checkbox(
                      isChecked: isChecked,
                      onChange: (value) {
                        isChecked = value;
                        print(isChecked);
                      },
                      backgroundColor: Colors.white,
                      borderColor: Color(0xFF006633),
                      icon: Icons.check,
                      size: 40,
                      iconColor: Color(0xFF006633),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 46, right: 45),
              child: Container(
                height: 130,
                decoration: BoxDecoration(color: Color(0xFFFFB640), borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 40, 20, 40),
                      height: 60,
                      width: 178,
                      child: Text(
                        "Combinar com o comprador",
                        style: TextStyle(fontSize: 23, color: Color(0xFF4D0351), fontWeight: FontWeight.w700),
                      ),
                    ),
                    Custom_Checkbox(
                      isChecked: isChecked,
                      onChange: (value) {
                        isChecked = value;
                        print(isChecked);
                      },
                      backgroundColor: Colors.white,
                      borderColor: Color(0xFFFF6600),
                      icon: Icons.check,
                      size: 40,
                      iconColor: Color(0xFFFF6600),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 165),
              child: Container(
                padding: EdgeInsets.only(top: 30, bottom: 50, right: 45, left: 45),
                height: 170,
                // width: 414,
                color: Color.fromRGBO(180, 216, 216, 0.2),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                elevation: 0,
                                primary: Color(0xFF22AB86),
                                // fixedSize: Size(324, 60),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Color(0xFF006633),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ))),
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => ReviewAdScreen(img: widget.img)));
                            },
                            child: Text(
                              AppStrings.BTN_CONTINUAR,
                              style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
