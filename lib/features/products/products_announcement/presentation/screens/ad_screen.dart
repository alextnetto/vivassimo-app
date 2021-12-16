import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/features/home/presentation/widgets/tab_item.dart';

class AdScreen extends StatefulWidget {
  final List img;
  AdScreen({required this.img});

  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  TextEditingController? _controller;

  String _enteredText = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 34),
              child: Container(
                alignment: Alignment.topRight,
                height: 25,
                child: Text(
                  'Alimentos e Bebidas',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4D0351)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 272,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: FileImage(
                      File(widget.img[0]),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28, right: 22, left: 22),
              child: Container(
                alignment: Alignment.topLeft,
                height: 31,
                child: Text(
                  'Bolo Caseiro de Chocolate',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4D0351)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 140,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 13, right: 23, bottom: 56),
                        alignment: Alignment.topRight,
                        height: 101,
                        child: Text(
                          'R\$ 29,90',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF22AB86)),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(180, 216, 216, 0.2),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 68,
                      left: 45,
                      right: 45,
                      child: Container(
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
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart_sharp,
                                  size: 29,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Quero Comprar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 45),
              child: Container(
                height: 20,
                alignment: Alignment.topLeft,
                child: Text(
                  'Formas de Pagamento',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4D0351)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 49, top: 22),
              child: Container(
                height: 50,
                child: Image.asset('assets/images/pagamento.jpeg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Container(
                width: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: Color.fromRGBO(180, 216, 216, 0.2)),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 60, left: 60, top: 30,bottom:19),
                      child: Container(
                        child: Text('Consulte o Frete para sua região',
                            style: TextStyle(
                                color: Color(0xFF4D0351),
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 19,right: 19),
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xFF4D0351)),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
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
                            counter: Offstage(),
                            contentPadding:
                                EdgeInsets.only(right: 12, left: 12, bottom: 0),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none),
                        cursorColor: Color(0xFF4D0351),
                        style: TextStyle(
                            // fontFamily: 'Manrope',
                            color: Color(0xFF4D0351),
                            fontSize: 26,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.end,
                        controller: _controller,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  int _selectedIndex = 0;

  Widget bottomNavigationBar() {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(20)),
        boxShadow: const [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Material(
          elevation: 40,
          child: SizedBox(
            height: 60,
            child: Material(
              elevation: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TabItemWidget(
                    iconPath: 'assets/images/home_icon.jpeg',
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    selectedIndex: _selectedIndex,
                    title: "Inicio",
                  ),
                  VerticalDivider(color: Color(0xffA480BD), width: 1),
                  TabItemWidget(
                    iconPath: 'assets/images/announce_icon.png',
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    selectedIndex: _selectedIndex,
                    title: "Anunciar",
                  ),
                  VerticalDivider(color: Color(0xffA480BD), width: 1),
                  TabItemWidget(
                    iconPath: 'assets/images/order_icon.jpeg',
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    selectedIndex: _selectedIndex,
                    title: "Pedidos",
                  ),
                  VerticalDivider(color: Color(0xffA480BD), width: 1),
                  TabItemWidget(
                    iconPath: 'assets/images/person_icon.png',
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    selectedIndex: _selectedIndex,
                    title: "Perfil",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
