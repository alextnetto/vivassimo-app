import 'package:flutter/material.dart';
import 'package:my_app/core/ui/components/bottom_navigator_bar_app.dart';
import 'my_announcements_screen.dart';

class MyEmptyAnnouncementScreen extends StatefulWidget {
  const MyEmptyAnnouncementScreen({Key? key}) : super(key: key);

  @override
  _MyEmptyAnnouncementScreenState createState() => _MyEmptyAnnouncementScreenState();
}

class _MyEmptyAnnouncementScreenState extends State<MyEmptyAnnouncementScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
              child: SizedBox(
                child: Text(
                  'Meus Anúnciosss',
                  style: TextStyle(color: Color(0xFF4D0351), fontSize: 26, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, right: 45, left: 45),
              child: SizedBox(
                child: Text(
                  'Você ainda não possui \n nenhum anúncio realizado.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4D0351),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 108, left: 108, top: 45),
              child: Image.asset('assets/images/yoga.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 240, left: 45, right: 45, bottom: 47),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyAnnouncementsScreen()));
                        },
                        child: Text(
                          'Anunciar agora!',
                          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
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
      bottomNavigationBar: BottomNavigatorBarApp(selectedIndex: 2),
    );
  }

  // Widget bottomNavigationBar() {
  //   return Container(
  //     height: 72,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.only(
  //           topRight: Radius.circular(30), topLeft: Radius.circular(20)),
  //       boxShadow: const [
  //         BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
  //       ],
  //     ),
  //     child: ClipRRect(
  //       borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
  //                   iconPath: 'assets/images/home_icon.jpeg',
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
  //                   iconPath: 'assets/images/announce_icon.png',
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
  //                   iconPath: 'assets/images/order_icon.jpeg',
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
  //                   iconPath: 'assets/images/person_icon.png',
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
