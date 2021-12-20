import 'package:flutter/material.dart';
import 'package:my_app/features/home/presentation/widgets/tab_item.dart';

// ignore: must_be_immutable
class BottomNavigatorBarApp extends StatelessWidget {
  final int selectedIndex;
  const BottomNavigatorBarApp({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(20)),
        boxShadow: const [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                    iconPath: 'assets/icon/home_icon.png',
                    onTap: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    selectedIndex: selectedIndex,
                    setBorderBottom: selectedIndex == 1,
                    title: "Inicio",
                  ),
                  VerticalDivider(color: Color(0xffA480BD), width: 1),
                  TabItemWidget(
                    iconPath: 'assets/icon/announce_icon.png',
                    onTap: () {
                      Navigator.of(context).pushNamed('/sign_or_signup', arguments: {'redirectTo': 'my_announcements'});
                    },
                    selectedIndex: selectedIndex,
                    setBorderBottom: selectedIndex == 2,
                    title: "Anunciar",
                  ),
                  VerticalDivider(color: Color(0xffA480BD), width: 1),
                  TabItemWidget(
                    iconPath: 'assets/icon/order_icon.png',
                    onTap: () {
                      // selectedIndex = 2;
                    },
                    setBorderBottom: selectedIndex == 3,
                    selectedIndex: selectedIndex,
                    title: "Pedidos",
                  ),
                  VerticalDivider(color: Color(0xffA480BD), width: 1),
                  TabItemWidget(
                    iconPath: 'assets/icon/person_icon.png',
                    onTap: () {
                      // selectedIndex = 3;
                    },
                    selectedIndex: selectedIndex,
                    setBorderBottom: selectedIndex == 4,
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
