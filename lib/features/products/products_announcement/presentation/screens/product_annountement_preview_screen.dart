import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/core/ui/app_masks/app_masks.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/bottom_navigator_bar_app.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/features/products/products_announcement/presentation/widgets/product_announcemente_rating_widget.dart';

class ProductAnnouncementPreviewScreen extends StatefulWidget {
  final List img;
  const ProductAnnouncementPreviewScreen({Key? key, required this.img}) : super(key: key);

  @override
  _ProductAnnouncementPreviewScreenState createState() => _ProductAnnouncementPreviewScreenState();
}

class _ProductAnnouncementPreviewScreenState extends State<ProductAnnouncementPreviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 3),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 34),
                child: Container(
                  alignment: Alignment.topRight,
                  height: 25,
                  child: Text(
                    'Alimentos e Bebidas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF4D0351)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Stack(
                  children: [
                    Container(
                      height: 272,
                      width: MediaQuery.of(context).size.width,
                      child: Image.file(
                        File(widget.img[0]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(right: 30, bottom: 20, child: Image.asset('assets/icon/btn_next_yellow.png')),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8),
              //   child: Container(
              //       height: 272,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           fit: BoxFit.fill,
              //           image: FileImage(
              //             File(widget.img[0]),
              //           ),
              //         ),
              //       ),
              //       child: Container(
              //         width: 55,
              //         height: 55,
              //         child: FloatingActionButton(
              //           child: Text('x'),
              //           onPressed: () {},
              //         ),
              //       )),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 28, right: 22, left: 22),
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 31,
                  child: Text(
                    'Bolo Caseiro de Chocolate',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Color(0xFF4D0351)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 140,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Container(
                          padding: EdgeInsets.only(top: 13, right: 23, bottom: 56),
                          alignment: Alignment.topRight,
                          height: 101,
                          child: Text(
                            'R\$ 29,90',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xFF22AB86)),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(180, 216, 216, 0.2),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              border: Border.all(color: Color.fromRGBO(99, 95, 117, 0.2))),
                        ),
                      ),
                      Positioned(
                        top: 68,
                        left: 45,
                        right: 45,
                        child: SizedBox(
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
                              children: const [
                                Icon(
                                  Icons.shopping_cart_sharp,
                                  size: 29,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Quero Comprar',
                                  style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF4D0351)),
                  ),
                ),
              ),
              Container(
                // height: 50,
                padding: const EdgeInsets.only(top: 20),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset('assets/icon/payment_methods_icons/visa.png'),
                    SizedBox(width: 10),
                    Image.asset('assets/icon/payment_methods_icons/mastercard.png'),
                    SizedBox(width: 10),
                    Image.asset('assets/icon/payment_methods_icons/elo.png'),
                    SizedBox(width: 10),
                    Image.asset('assets/icon/payment_methods_icons/amex.png'),
                    SizedBox(width: 10),
                    Image.asset('assets/icon/payment_methods_icons/pix.png'),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(99, 95, 117, 0.2))),
                  // color: Color.fromRGBO(180, 216, 216, 0.2)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 60, left: 60, top: 30, bottom: 19),
                        child: SizedBox(
                          child: Text('Consulte o Frete para sua região',
                              style: TextStyle(color: Color(0xFF4D0351), fontSize: 18, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 46, right: 46),
                        child: Observer(builder: (_) {
                          return AppTextField(
                            // controller: newAddressStore.cepController,
                            onChanged: (value) async {
                              if (value.length == 9) {
                                // LoadingIndicator.show(context);
                                // newAddressStore.getAddressByCep(value, context).then((value) {
                                //   LoadingIndicator.hide(context);
                                // });
                              }
                            },
                            label: 'CEP',
                            inputFormatters: [AppMasks.cep],
                            // errorText: newAddressStore.getCepError,
                          );
                        }),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 55),
                        margin: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('PAC', style: customTextStyle(FontWeight.w600, 18, Color(0xff2C0833))),
                                Text('2 Dias Úteis', style: customTextStyle(FontWeight.w600, 18, Color(0xff2C0833))),
                                Text('Grátis', style: customTextStyle(FontWeight.w600, 18, Color(0xff22AB86))),
                              ],
                            ),
                            Divider(color: Color(0xffB4D8D8)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sedex', style: customTextStyle(FontWeight.w600, 18, Color(0xff2C0833))),
                                Text('1 Dia Útil', style: customTextStyle(FontWeight.w600, 18, Color(0xff2C0833))),
                                Text('R\$ 14,00', style: customTextStyle(FontWeight.w600, 18, Color(0xff22AB86))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xffB4D8D8)),
                      Container(
                        padding: const EdgeInsets.only(top: 25, left: 22, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Descrição', style: AppTextStyles.defaultTextStyleTitle),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Delicioso bolo feito com ingredientes selecionados, perfeito para acompanhar aquele café da tarde. Chocolate 70% Cacau Cobertura com Pedaços de Chocolate Embalagem Segura Encomende já o seu!',
                                    style: AppTextStyles.defaultTextStyleDescriptionGrey,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Glória Silva', style: AppTextStyles.defaultTextStyleDescriptionPurple),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '(011 99999-9999)',
                                  style: customTextStyle(FontWeight.bold, 23, Color(0xff635F75)),
                                ),
                                Container(
                                  height: 40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: Color(0xff22AB86),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Ligar',
                                          style: customTextStyle(FontWeight.bold, 18, Colors.white),
                                        ),
                                        SizedBox(width: 15),
                                        Icon(Icons.phone, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Centro - São Paulo/SP',
                              style: AppTextStyles.defaultTextStyleDescriptionGrey,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 35, left: 22),
                        child: Text('O que dizem sobre este produto',
                            style: AppTextStyles.defaultTextStyleDescriptionPurple),
                      ),
                      SizedBox(height: 20),
                      ProductAnnouncementRatingWidget(
                        amountStars: 5,
                        customerName: 'José Carlos',
                        ratingDate: '02/08/21',
                        ratingDescription:
                            'Excelentes profissionais!!! Bem qualificados, muito atenciosos e dedicados!!! Super recomendo!!',
                        ratingIcon: 'assets/icon/smile_rating_icon.png',
                      ),
                      ProductAnnouncementRatingWidget(
                        amountStars: 5,
                        customerName: 'Maria Oliveira',
                        ratingDate: '02/08/21',
                        ratingDescription:
                            'Excelentes profissionais!!! Bem qualificados, muito atenciosos e dedicados!!! Super recomendo!!',
                        ratingIcon: 'assets/icon/smile_rating_icon.png',
                      ),
                      ProductAnnouncementRatingWidget(
                        amountStars: 5,
                        customerName: 'Alberto Torres',
                        ratingDate: '02/08/21',
                        ratingDescription:
                            'Excelentes profissionais!!! Bem qualificados, muito atenciosos e dedicados!!! Super recomendo!!',
                        ratingIcon: 'assets/icon/smile_rating_icon.png',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorBarApp(selectedIndex: 2),
    );
  }

  // Widget bottomNavigationBar() {
  //   return Container(
  //     height: 72,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(20)),
  //       boxShadow: const [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
  //     ),
  //     child: ClipRRect(
  //       borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //       child: Material(
  //         elevation: 40,
  //         child: SizedBox(
  //           height: 60,
  //           child: Material(
  //             elevation: 40,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 TabItemWidget(
  //                   iconPath: 'assets/icon/home_icon.png',
  //                   onTap: () {
  //                     Navigator.of(context).pushNamed('/home');
  //                   },
  //                   selectedIndex: _selectedIndex,
  //                   title: "Inicio",
  //                 ),
  //                 VerticalDivider(color: Color(0xffA480BD), width: 1),
  //                 TabItemWidget(
  //                   iconPath: 'assets/icon/announce_icon.png',
  //                   onTap: () {
  //                     setState(() {
  //                       _selectedIndex = 1;
  //                     });
  //                   },
  //                   selectedIndex: _selectedIndex,
  //                   title: "Anunciar",
  //                 ),
  //                 VerticalDivider(color: Color(0xffA480BD), width: 1),
  //                 TabItemWidget(
  //                   iconPath: 'assets/icon/order_icon.png',
  //                   onTap: () {
  //                     setState(() {
  //                       _selectedIndex = 2;
  //                     });
  //                   },
  //                   selectedIndex: _selectedIndex,
  //                   title: "Pedidos",
  //                 ),
  //                 VerticalDivider(color: Color(0xffA480BD), width: 1),
  //                 TabItemWidget(
  //                   iconPath: 'assets/icon/person_icon.png',
  //                   onTap: () {
  //                     setState(() {
  //                       _selectedIndex = 3;
  //                     });
  //                   },
  //                   selectedIndex: _selectedIndex,
  //                   title: "Perfil",
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
