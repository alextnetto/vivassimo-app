import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/utils/formatters/currency_pt_br_input_formatter.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_announcement_delivery_screen.dart';

class ProductValueScreen extends StatefulWidget {
  final List img;

  const ProductValueScreen({Key? key, required this.img}) : super(key: key);
  @override
  _ProductValueScreenState createState() => _ProductValueScreenState();
}

class _ProductValueScreenState extends State<ProductValueScreen> {

  @override
  void initState() {
    super.initState();
    // changeStatusBar();
  }

  // changeStatusBar() {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarIconBrightness: Brightness.dark,
  //       statusBarColor: Color.fromRGBO(180, 216, 216, 0.2),
  //       systemNavigationBarColor: Color(0xFF4D0351)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          height: 120,
                          // padding: const EdgeInsets.only(top: 25),
                          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                          decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
                          child: Column(
                            children: const [
                              AppBarDefaultWidget(title: 'Anunciar'),
                              SizedBox(height: 10),
                              LinearProgressBar(textIndicator: '6/8', percentageValue: 0.75),
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
                                  'Qual o valor do produto?',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.defaultTextStyleTitleBig,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 46, right: 43, left: 53),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 13),
                                child: Text(
                                  'RS',
                                  style: TextStyle(color: Color(0xFF4D0351), fontSize: 26, fontWeight: FontWeight.w800),
                                ),
                              ),
                              Expanded(
                                child: AppTextField(
                                  keyBoardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    CurrencyPtBrInputFormatter(
                                      maxDigits: 8,
                                    ),
                                  ],
                                  // controller: newAddressStore.cepController,
                                  onChanged: (value) async {},
                                  label: 'Insirar o valor',
                                  // inputFormatters: [AppMasks.cep],
                                  // errorText: newAddressStore.getCepError,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned.fill(
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(top: 18),
                        child: Container(
                          padding: EdgeInsets.only(top: 30, bottom: 50, right: 45, left: 45),
                          height: 170,
                          color: Color.fromRGBO(180, 216, 216, 0.2),
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
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductAnnouncementDeliveryScreen(img: widget.img)));
                                  },
                                  child: Text(
                                    'Continuar',
                                    style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
