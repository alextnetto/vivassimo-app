import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/core/ui/components/linear_progress_bar.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_value_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/stores/product_photo_confirmation_store.dart';

class ProductPhotoConfirmationScreen extends StatefulWidget {
  final String productPhotoTaken;

  const ProductPhotoConfirmationScreen({Key? key, required this.productPhotoTaken}) : super(key: key);

  @override
  _ProductPhotoConfirmationScreenState createState() => _ProductPhotoConfirmationScreenState();
}

class _ProductPhotoConfirmationScreenState extends State<ProductPhotoConfirmationScreen> {
  String get productPhotoTaken => widget.productPhotoTaken;
  ProductPhotoConfirmationStore? productPhotoConfirmationStore;

  double? altura;
  int? contador;
  File? image;
  // List imagesPathList = [];
  File? imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    productPhotoConfirmationStore = Modular.get<ProductPhotoConfirmationStore>();
    productPhotoConfirmationStore!.imagesPathList.add(productPhotoTaken);
    changeStatusBar();
    super.initState();
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  File? imageGalery;
  Future pickImageGalery() async {
    try {
      final imageGalery = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGalery == null) return;
      final imageTemporary = File(imageGalery.path);
      setState(() {
        this.imageGalery = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  changeStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Color.fromRGBO(180, 216, 216, 0.2),
        systemNavigationBarColor: Color(0xFF4D0351)));
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        productPhotoConfirmationStore!.imagesPathList.add(pickedFile.path);
      });
    }
  }

  double calculateHeight() {
    var hgt = productPhotoConfirmationStore!.imagesPathList.length + 1;
    if (hgt == 1 || hgt == 2) {
      return 360.0;
    } else if (hgt == 3 || hgt == 4) {
      return 400.0;
    } else if (hgt == 5 || hgt == 6) {
      return 500.0;
    } else if (hgt == 6 || hgt == 7) {
      return 460.0;
    }
    return 360.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 120,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
            child: Column(
              children: const [
                AppBarDefaultWidget(title: 'Anunciar'),
                SizedBox(
                  height: 10,
                ),
                LinearProgressBar(textIndicator: '5/8', percentageValue: 0.625),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 21, right: 70, left: 70, bottom: 20),
            child: SizedBox(
              child: Text(
                "Adicione até 6 fotos",
                style: TextStyle(fontSize: 26, color: Color(0xFF560955), fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: const EdgeInsets.only(bottom: 50),
            // height: calculateHeight(),
            child: Observer(builder: (_) {
              return GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: productPhotoConfirmationStore!.getImagesPathListLength,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.5,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (BuildContext context, index) {
                  return index == productPhotoConfirmationStore!.imagesPathList.length
                      ? productPhotoConfirmationStore!.imagesPathList.length == 6
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                chooseImage();
                              },
                              child: Material(
                                elevation: 2,
                                child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icon/Plus.png',
                                        width: 30,
                                        // alignment: Alignment(0, 5),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Adicionar \n Imagem',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF22AB86), fontWeight: FontWeight.w800, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                      : Material(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(File(productPhotoConfirmationStore!.imagesPathList[index])),
                                ),
                              ),
                            ),
                          ),
                        );
                },
              );
            }),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 30, bottom: 50, right: 45, left: 45),
              alignment: Alignment.bottomCenter,
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
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductValueScreen(img: productPhotoConfirmationStore!.imagesPathList)));
                        },
                        child: Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
