import 'package:flutter/material.dart';
import 'package:my_app/core/entities/store_entity.dart';
import 'package:my_app/core/ui/components/bottom_navigator_bar_app.dart';
import 'package:my_app/core/ui/components/stores_list_component.dart';
import 'package:my_app/core/ui/widgets/app_button.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBody: true,
        body: buildBody(context),
        bottomNavigationBar: BottomNavigatorBarApp(selectedIndex: 1),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
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
                      GestureDetector(
                        onTap: () {
                          if (AppHelpers.isInternetActive) {
                            executeRedirectServiceDescriptionAction();
                          } else {
                            Navigator.of(context).pushNamed('/internet-connection', arguments: {
                              'executeAction': executeRedirectServiceDescriptionAction,
                            });
                          }
                        },
                        child: Container(
                          height: 177,
                          margin: EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Hero(
                                tag: 'image_carousel_home',
                                child: Image.asset(
                                  'assets/backgrounds/pilates_class_banner.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
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
              return Hero(
                tag: 'image_category_home_$index',
                child: GestureDetector(
                  onTap: () {
                    if (AppHelpers.isInternetActive) {
                      executeItemCategoryAction(index);
                    } else {
                      Navigator.of(context).pushNamed('/internet-connection', arguments: {
                        'executeActionWithParameter': executeItemCategoryAction,
                        'parameter': index,
                      });
                    }
                  },
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
                      padding: EdgeInsets.only(right: 8, top: 5),
                      child: Image.asset(
                        'assets/products_type/product_type_item_${index + 1}.png',
                        // width: 100,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        AppButton(
          borderColor: Color(0XFFB4D8D8),
          buttonColor: Color(0XFFE9F3F4),
          fontSize: 23,
          fontWeight: FontWeight.bold,
          textColor: Color(0XFF4D0351),
          title: 'Ver todas as categorias',
          onPressed: () {},
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: const EdgeInsets.only(top: 20),
        ),
        StoresListComponent(
          title: 'Lojas em sua região',
          paddingBottom: 100,
          storeEntities: const [
            StoreEntity(
              description: 'Saúde & Bem-estar',
              name: 'Academia Health Fit',
              imagePath: 'assets/images/stores/store1.png',
            ),
            StoreEntity(
              description: 'Saúde & Bem-estar',
              name: 'Fitness Center',
              imagePath: 'assets/images/stores/store2.png',
            ),
            StoreEntity(
              description: 'Saúde & Bem-estar',
              name: 'Academia Health Fit',
              imagePath: 'assets/images/stores/store1.png',
            ),
            StoreEntity(
              description: 'Saúde & Bem-estar',
              name: 'Fitness Center',
              imagePath: 'assets/images/stores/store2.png',
            ),
          ],
        ),
      ],
    );
  }

  executeItemCategoryAction(index) {
    Navigator.of(context).pushNamed('/home/product-category', arguments: {'index': index});
  }

  void executeRedirectServiceDescriptionAction() {
    Navigator.of(context).pushNamed('/services-purchase/service-description');
  }
}
