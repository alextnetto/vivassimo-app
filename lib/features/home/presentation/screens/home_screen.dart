import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/features/home/presentation/widgets/home_widgets.dart';
import 'package:my_app/features/home/presentation/widgets/tab_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: buildBodyWithoutStack(context),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget buildBodyWithoutStack(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image.asset('assets/backgrounds/Vector.png'),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.25)))),
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/logos/vivassimo_logo.png'),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              color: Color(0xFFFFB640),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                  child: Row(
                    children: [
                      Image.asset('assets/icon/localization_icon.png'),
                      SizedBox(width: 10),
                      Text(
                        'Av. Paulista, 930',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite um produto ou serviço',
                      hintStyle: TextStyle(
                        color: Color(0xFF4D0351),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Image.asset('assets/icon/search_icon.png'),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff4D0351),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff4D0351),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff4D0351),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 177,
                  margin: EdgeInsets.only(top: 15),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      left: 13,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 177,
                        margin: EdgeInsets.only(left: 0),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: Image.asset(
                              'assets/backgrounds/pilates_class.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 177,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 177,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 266,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 15, right: 15, top: 21),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 8,
              childAspectRatio: (1.5 / 1),
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/products_type/product_type_background_${index + 1}.png'),
                    ),
                    // color: Colors.blue,
                  ),
                  height: 130,
                  width: 188,
                  child: Container(
                    padding: EdgeInsets.only(right: 12, top: 5),
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image.asset(
                      'assets/products_type/product_type_item_${index + 1}.png',
                      // width: 100,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Lojas em sua região',
                style: customTextStyle(FontWeight.bold, 18, Color(0xFF560955)),
              ),
              padding: const EdgeInsets.only(left: 20, top: 40),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 100, top: 20),
              child: Column(
                children: const [
                  StoreTileWidget(
                    title: 'Academia Health Fit',
                    description: 'Saúde & Bem-estar',
                    imagePath: 'assets/images/stores/store1.png',
                    border: Border(bottom: BorderSide(color: Color(0XFFB4D8D8))),
                    backgroundColor: Color.fromRGBO(180, 216, 216, 0.2),
                  ),
                  StoreTileWidget(
                    title: 'Fitness Center',
                    description: 'Saúde & Bem-estar',
                    imagePath: 'assets/images/stores/store2.png',
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  StoreTileWidget(
                    description: 'Saúde & Bem-estar',
                    title: 'Academia Health Fit',
                    imagePath: 'assets/images/stores/store1.png',
                    border: Border(bottom: BorderSide(color: Color(0XFFB4D8D8))),
                    backgroundColor: Color.fromRGBO(180, 216, 216, 0.2),
                  ),
                  StoreTileWidget(
                    title: 'Fitness Center',
                    description: 'Saúde & Bem-estar',
                    imagePath: 'assets/images/stores/store2.png',
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bottomNavigationBar() {
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
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    selectedIndex: _selectedIndex,
                    title: "Inicio",
                  ),
                  VerticalDivider(color: Color(0xffA480BD), width: 1),
                  TabItemWidget(
                    iconPath: 'assets/icon/announce_icon.png',
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
                    iconPath: 'assets/icon/order_icon.png',
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
                    iconPath: 'assets/icon/person_icon.png',
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
