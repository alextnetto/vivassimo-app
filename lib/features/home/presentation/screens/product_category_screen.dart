import 'package:flutter/material.dart';
import 'package:my_app/core/entities/store_entity.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/stores_list_component_with_rating.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  _ProductCategoryScreenState createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarDefaultWidget(title: 'Alimentos & Bebidas'),
          Stack(
            children: [
              Container(
                height: 200,
                alignment: Alignment.centerRight,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/stores/orange_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.0,
                  padding: const EdgeInsets.only(left: 15),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Deliciosas opções com descontos \n de \n até ',
                          style: customTextStyle(FontWeight.bold, 23, Color(0XFF560955),
                              letterSpacing: -1.6, lineHeight: 1),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 40,
                        child: RichText(
                          text: TextSpan(
                            text: '30 ',
                            style: customTextStyle(FontWeight.bold, 66, Color(0XFF560955),
                                letterSpacing: -9.6, lineHeight: 1),
                            children: <TextSpan>[
                              TextSpan(text: '%', style: customTextStyle(FontWeight.bold, 30, Color(0XFF560955))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(top: 30),
                ),
              ),
              Positioned(
                right: 0,
                top: 30,
                child: SizedBox(
                  child: Image.asset('assets/products_type/product_type_item_big_1.png'),
                  // margin: const EdgeInsets.only(top: 30),
                ),
              ),
            ],
          ),
          StoresListComponentWithRating(
            title: 'Mais pedidos na sua região',
            paddingBottom: 100,
            storeEntities: const [
              StoreEntity(
                name: 'Hot Dog Delivery',
                imagePath: 'assets/images/stores/store_image1.png',
                deliveryFee: 0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Restaurante DuChef',
                imagePath: 'assets/images/stores/store_image2.png',
                deliveryFee: 5.0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Pan Adicta',
                imagePath: 'assets/images/stores/store_image3.png',
                deliveryFee: 0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Chapos Tacos',
                imagePath: 'assets/images/stores/store_image4.png',
                deliveryFee: 5.0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Buns and Guns',
                imagePath: 'assets/images/stores/store_image5.png',
                deliveryFee: 0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Doner Shack',
                imagePath: 'assets/images/stores/store_image6.png',
                deliveryFee: 5.0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Cono de Pasta',
                imagePath: 'assets/images/stores/store_image7.png',
                deliveryFee: 5.0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Big Buns',
                imagePath: 'assets/images/stores/store_image8.png',
                deliveryFee: 5.0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
              StoreEntity(
                name: 'Egg & Chesse',
                imagePath: 'assets/images/stores/store_image9.png',
                deliveryFee: 5.0,
                deliveryTime: '30-40min',
                kmDistance: '1.6km',
                rate: '4.8',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
