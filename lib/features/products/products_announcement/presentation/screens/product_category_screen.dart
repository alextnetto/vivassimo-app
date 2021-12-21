import 'package:flutter/material.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/features/products/products_announcement/presentation/widgets/category_item_widget.dart';
import '../../products_announcement_module.dart';
import 'model.dart';

class ProductAnnouncementCategoryScreen extends StatefulWidget {
  const ProductAnnouncementCategoryScreen({Key? key}) : super(key: key);

  @override
  _ProductAnnouncementCategoryScreenState createState() => _ProductAnnouncementCategoryScreenState();
}

class _ProductAnnouncementCategoryScreenState extends State<ProductAnnouncementCategoryScreen> {
  @override
  void initState() {
    // changeStatusBar();
    initModule(ProductsAnnouncementModule());
    super.initState();
  }

  // changeStatusBar() {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarColor: Color.fromRGBO(180, 216, 216, 0.2), systemNavigationBarColor: Color(0xFF4D0351)));
  // }

  List<CategoryItem> items = [
    CategoryItem(text: 'Acessórios \n para Veículos'),
    CategoryItem(text: 'Agro e Indústria'),
    CategoryItem(
      text: 'Alimentos e Bebidas',
      path: 'assets/images/almoco.jpeg',
      // screen: AnunciarProdutoScreen(model: Model()),
    ),
    CategoryItem(text: 'Animais \n de estimação'),
    CategoryItem(text: 'Artigos \n Infantis '),
    CategoryItem(text: 'Casa, Móveis \n e Decoração'),
    CategoryItem(text: 'Comércio \n e Escritório'),
    CategoryItem(text: 'Eletrônicos \n e Celulares'),
    CategoryItem(text: 'Esporte \n e Lazer'),
    CategoryItem(text: 'Instrumentos \n Musicais'),
    CategoryItem(text: 'Jóias \n e Relógios'),
    CategoryItem(text: 'Moda \n e Beleza'),
    CategoryItem(text: 'Música \n e Hobbies'),
    CategoryItem(text: 'Para a sua \n Casa'),
    CategoryItem(text: 'Saúde'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Anunciar'),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressBar(textIndicator: '1/8', percentageValue: 0.125),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Escolha a categoria do seu produto',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.defaultTextStyleTitleBig,
                    ),
                  )
                ],
              ),
            ),
            for (int index = 1; index <= items.length - 1; index++)
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/product/products_announcement/product_announcement_info', arguments: {
                      'model': CategoryAnnouncementEntity(productCategory: items[index].text),
                    });
                  },
                  child: buildCategoryCard(index)),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(int index) {
    return Container(
      margin: EdgeInsets.only(top: 45, left: 25, right: 25),
      height: 130,
      padding: const EdgeInsets.only(left: 15, right: 5),
      // width: 376,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFB4D8D8),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: SizedBox(
              child: Text(
                '${items[index - 1].text}',
                style: TextStyle(color: Color(0xFF4D0351), fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              alignment: index == 2 ? Alignment.bottomCenter : null,
              child: Image.asset('assets/images/product_announcement/product_categories/announcement_image_$index.png'),
            ),
          )
        ],
      ),
    );
  }
}
