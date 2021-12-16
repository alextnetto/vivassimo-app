import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/features/products/products_announcement/presentation/PageUtils/AppStrings.dart';

import 'ad_success_screen.dart';

class ReviewAdScreen extends StatefulWidget {
  final List img;
  ReviewAdScreen({required this.img});

  @override
  _ReviewAdScreenState createState() => _ReviewAdScreenState();
}

class _ReviewAdScreenState extends State<ReviewAdScreen> {
  var _controller1 = TextEditingController();

  var _controller2 = TextEditingController();

  var _controller3 = TextEditingController();

  var _controller4 = TextEditingController();

  var _controller5 = TextEditingController();

  var _controller6 = TextEditingController();

  String _enteredText = '';

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
                            children: [
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
                              value: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '8/8',
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
              padding: const EdgeInsets.only(top: 21, right: 70, left: 70),
              child: Container(
                child: Text(
                  "Revise e anuncie",
                  style: TextStyle(fontSize: 26, color: Color(0xFF560955), fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Fotos',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 18, color: Color(0xFF560955), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(45, 0, 45, 0),
              height: calculateHeight(),
              child: GridView.builder(
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
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        _enteredText = value;
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
                    controller: _controller1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        _enteredText = value;
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
                    controller: _controller2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        _enteredText = value;
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
                    controller: _controller3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        _enteredText = value;
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
                    controller: _controller4,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                        _enteredText = value;
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
                    controller: _controller5,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 21),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    maxLines: 2000,
                    maxLength: 2000,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {
                      setState(() {
                        _enteredText = value;
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
                    controller: _controller6,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
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
                      Container(
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
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdSuccessScreen(
                                          img: widget.img,
                                        )));
                          },
                          child: Text(
                            'Anunciar',
                            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                        ),
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
