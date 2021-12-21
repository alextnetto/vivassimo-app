import 'package:flutter/material.dart';
import 'package:my_app/core/ui/components/bottom_navigator_bar_app.dart';

class MyAnnouncementsScreen extends StatefulWidget {
  const MyAnnouncementsScreen({Key? key}) : super(key: key);

  @override
  _MyAnnouncementsScreenState createState() => _MyAnnouncementsScreenState();
}

class _MyAnnouncementsScreenState extends State<MyAnnouncementsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 100, left: 100),
                child: SizedBox(
                  child: Text(
                    'Meus anúncios',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF4D0351), fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 22, left: 22),
                child: SizedBox(
                  height: 173,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 130,
                            padding: EdgeInsets.only(top: 15, left: 21.65),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Color(0xFFB4D8D8)),
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(180, 216, 216, 0.2),
                            ),
                            child: Text(
                              'Bolo caseiro de Chocolate',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF4D0351)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                        ),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Color(0xFFB4D8D8)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 23),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 13),
                                      child: Text(
                                        'Ativo',
                                        style: TextStyle(
                                          color: Color(0xFF22AB86),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        '405 Visitas',
                                        style: TextStyle(
                                          color: Color(0xFF4D0351),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 19),
                                        child: Text(
                                          'Ver Detalhes',
                                          style: TextStyle(
                                              color: Color(0xFF3399CC),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              decoration: TextDecoration.underline),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13, left: 68, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    'assets/images/announcement/my_announcements_card_0.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 22, left: 22),
                child: SizedBox(
                  height: 173,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 130,
                            padding: EdgeInsets.only(top: 15, left: 21.65),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Color(0xFFB4D8D8)),
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(180, 216, 216, 0.2),
                            ),
                            child: Text(
                              'Aula de Violão',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF4D0351)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                        ),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Color(0xFFB4D8D8)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 23),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 13),
                                      child: Text(
                                        'Ativo',
                                        style: TextStyle(
                                          color: Color(0xFF22AB86),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        '405 Visitas',
                                        style: TextStyle(
                                          color: Color(0xFF4D0351),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 19),
                                        child: Text(
                                          'Ver Detalhes',
                                          style: TextStyle(
                                              color: Color(0xFF3399CC),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              decoration: TextDecoration.underline),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13, left: 68, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    'assets/images/announcement/my_announcements_card_1.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 45, right: 45, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
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
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseAnnouncementScreen()));
                          Navigator.of(context).pushNamed('/announcements/choose_announcement');
                        },
                        child: Text(
                          'Novo Anúncio',
                          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          bottomNavigationBar: BottomNavigatorBarApp(
            selectedIndex: 2,
          )),
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
  //                     setState(() {
  //                       _selectedIndex = 0;
  //                     });
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
