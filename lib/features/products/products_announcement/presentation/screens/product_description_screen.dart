import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/features/products/products_announcement/presentation/PageUtils/AppStrings.dart';

class ProductDescriptionScreen extends StatefulWidget {
  const ProductDescriptionScreen({Key? key}) : super(key: key);

  @override
  _ProductDescriptionScreenState createState() => _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  TextEditingController? _controller;
  String _enteredText = '';

  @override
  void initState() {
    super.initState();
    // changeStatusBar();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
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
                  LinearProgressBar(textIndicator: '3/4', percentageValue: 0.75),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Descreva o seu produto',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.defaultTextStyleTitleBig,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 46, top: 45),
              child: Container(
                width: 324,
                height: 447,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF4D0351)),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                child: TextField(
                  maxLines: 2000,
                  maxLength: 2000,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  onChanged: (value) {
                    setState(() {
                      _enteredText = value;
                    });
                  },
                  decoration: InputDecoration(
                      counter: Offstage(),
                      contentPadding: EdgeInsets.only(right: 25, left: 25, top: 25),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none),
                  cursorColor: Color(0xFF4D0351),
                  style: TextStyle(
                      fontFamily: 'Manrope', color: Color(0xFF4D0351), fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                  controller: _controller,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, top: 15, left: 268),
              child: Column(
                children: [
                  SizedBox(
                    width: 84,
                    height: 25,
                    child: Text(
                      '${_enteredText.length.toString()}/2000',
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'Manrope', fontWeight: FontWeight.w900, color: Color(0xFF4D0351)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                padding: EdgeInsets.only(top: 30, bottom: 80),
                height: 170,
                width: 414,
                color: Color.fromRGBO(180, 216, 216, 0.2),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        primary: Color(0xFF22AB86),
                        fixedSize: Size(324, 60),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(const Radius.circular(10)))),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/product/products_announcement/product_photos');
                    },
                    child: Text(
                      AppStrings.BTN_CONTINUAR,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Manrope',
                      ),
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
