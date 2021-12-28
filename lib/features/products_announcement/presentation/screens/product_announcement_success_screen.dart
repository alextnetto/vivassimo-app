import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/features/products_announcement/presentation/screens/product_annountement_preview_screen.dart';

class ProductAnnouncementSuccessScreen extends StatefulWidget {
  final String imagePath;

  const ProductAnnouncementSuccessScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  _ProductAnnouncementSuccessScreenState createState() => _ProductAnnouncementSuccessScreenState();
}

class _ProductAnnouncementSuccessScreenState extends State<ProductAnnouncementSuccessScreen> {
  String get imagePath => widget.imagePath;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 90),
            child: SizedBox(
              // height: 120,
              child: Text(
                'Muito bem! Anúncio realizado com sucesso!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF4D0351), fontSize: 34, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          SizedBox(
            height: 389,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/product_announcement/image_background_success.png',
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(350 / 360),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 100),
                      height: 174,
                      width: 238,
                      decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(color: Colors.white, spreadRadius: 10)],
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: FileImage(
                            File(imagePath),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/product_announcement/background_with_stains.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 50, right: 45, left: 45),
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
                              ))),
                      onPressed: () {},
                      child: Text(
                        'Compartilhar',
                        style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ),
          Container(
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
                        primary: Color(0xFFFFB640),
                        // fixedSize: Size(324, 60),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2.0,
                              color: Color(0xFFDE674B),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductAnnouncementPreviewScreen(
                            imagePath: imagePath,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Ver Anúncio',
                      style: TextStyle(color: Color(0xFF4D0351), fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
