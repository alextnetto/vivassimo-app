import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';

import 'model.dart';
import 'product_new_or_used_screen.dart';

class ProductAnnouncementScreen extends StatefulWidget {
  final CategoryAnnouncementEntity categoryEntity;

  const ProductAnnouncementScreen({Key? key, required this.categoryEntity}) : super(key: key);

  @override
  _ProductAnnouncementScreenState createState() => _ProductAnnouncementScreenState();
}

class _ProductAnnouncementScreenState extends State<ProductAnnouncementScreen> {
  TextEditingController? _controller;

  get categoryEntity => widget.categoryEntity;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    changeStatusBar();
  }

  changeStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(180, 216, 216, 0.2), systemNavigationBarColor: Color(0xFF4D0351)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 95,
              // padding: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Anunciar'),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressBar(textIndicator: '2/4', percentageValue: 0.5),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Informe o nome do produto,marca e modelo',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.defaultTextStyleTitleBig,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 46, left: 46, top: 46),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF4D0351),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: widget.categoryEntity.productCategory,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none),
                cursorColor: Color(0xFF4D0351),
                style: TextStyle(color: Color(0xFF4D0351), fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                controller: _controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45, top: 16),
              child: SizedBox(
                width: 314,
                height: 20,
                child: Text(
                  "Evite incluir condições de venda",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF635F75), fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonConfirm(
                          label: 'Continuar',
                          primary: Color(0xFF22AB86),
                          textColor: Color(0xFFFFFFFF),
                          borderColor: Color(0xFF006633),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/product/products_announcement/product_new_or_used');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
