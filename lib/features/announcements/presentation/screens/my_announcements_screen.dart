import 'package:flutter/material.dart';
import 'package:my_app/core/ui/components/bottom_navigator_bar_app.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
                    child: SizedBox(
                      child: Text(
                        'Meus Anúncios',
                        style: TextStyle(color: Color(0xFF4D0351), fontSize: 26, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      onTap: () {
                                        if (AppHelpers.isInternetActive) {
                                          executeAnnouncePreviewAction();
                                        } else {
                                          Navigator.of(context).pushNamed('/internet-connection', arguments: {
                                            'executeAction': executeAnnouncePreviewAction,
                                          });
                                        }
                                      },
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
                                padding: const EdgeInsets.only(top: 13,right: 10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      onTap: () {
                                        if (AppHelpers.isInternetActive) {
                                          executeAnnouncePreviewAction();
                                        } else {
                                          Navigator.of(context).pushNamed('/internet-connection', arguments: {
                                            'executeAction': executeAnnouncePreviewAction,
                                          });
                                        }
                                      },
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
                                padding: const EdgeInsets.only(top: 13, right: 10),
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
                          if (AppHelpers.isInternetActive) {
                            executeAnnouncementAction();
                          } else {
                            Navigator.of(context).pushNamed('/internet-connection', arguments: {
                              'executeAction': executeAnnouncementAction,
                            });
                          }
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

  void executeAnnouncementAction() {
    Navigator.of(context).pushNamed('/announcements/choose_announcement');
  }

  void executeAnnouncePreviewAction() {
    Navigator.of(context).pushNamed(
      '/product/products_announcement/product_announcement_preview',
      arguments: {
        'imagePath': 'assets/images/announcement/chocolate_cake.png',
      },
    );
  }
}
