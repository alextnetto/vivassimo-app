import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/features/products_announcement/infra/models/product_announcement_request_model.dart';

class ProductNewOrUsedScreen extends StatefulWidget {
  final ProductAnnouncementRequestModel productAnnouncementRequestModel;
  const ProductNewOrUsedScreen({Key? key, required this.productAnnouncementRequestModel}) : super(key: key);

  @override
  _ProductNewOrUsedScreenState createState() => _ProductNewOrUsedScreenState();
}

class _ProductNewOrUsedScreenState extends State<ProductNewOrUsedScreen> {
  ProductAnnouncementRequestModel get productModel => widget.productAnnouncementRequestModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 95,
            decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: const [
                AppBarDefaultWidget(title: 'Anunciar'),
                SizedBox(
                  height: 10,
                ),
                LinearProgressBar(textIndicator: '3/8', percentageValue: 0.375),
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
                    'O seu produto \n é novo ou usado?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.defaultTextStyleTitleBig,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 45),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2.0), borderRadius: BorderRadius.all(Radius.circular(10))),
                fixedSize: Size(324, 60),
                primary: Color(0xFF22AB86),
              ),
              onPressed: () {
                productModel.productCondition = 'Novo';

                Navigator.of(context).pushNamed('/product/products_announcement/product_description', arguments: {
                  'productAnnouncementRequestModel': productModel,
                });
              },
              child: Text(
                "Novo",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 45),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                fixedSize: Size(324, 60),
                primary: Color(0xFF22AB86),
              ),
              onPressed: () {
                productModel.productCondition = 'Usado';

                Navigator.of(context).pushNamed('/product/products_announcement/product_description', arguments: {
                  'productAnnouncementRequestModel': productModel,
                });
              },
              child: Text(
                "Usado",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
