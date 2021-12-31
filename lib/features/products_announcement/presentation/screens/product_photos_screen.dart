import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'package:my_app/features/products_announcement/infra/models/product_announcement_request_model.dart';

class ProductPhotosScreen extends StatefulWidget {
  final ProductAnnouncementRequestModel productAnnouncementRequestModel;

  const ProductPhotosScreen({Key? key, required this.productAnnouncementRequestModel}) : super(key: key);

  @override
  _ProductPhotosScreenState createState() => _ProductPhotosScreenState();
}

class _ProductPhotosScreenState extends State<ProductPhotosScreen> {
  ProductAnnouncementRequestModel get productModel => widget.productAnnouncementRequestModel;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<String> takePhotoFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return pickedFile.path;
    }

    return '';
  }

  Future<String> getImageFromGalery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 65,
              // decoration: BoxDecoration(color: Color.fromRGBO(180, 216, 216, 0.2)),
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                children: const [
                  AppBarDefaultWidget(title: 'Anunciar'),
                ],
              ),
            ),
            Image.asset('assets/images/product_announcement/product_photo_image.png'),
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 20, right: 20),
              child: SizedBox(
                // width: 250,
                // height: 64,
                child: Text(
                  'Adicione boas fotos \n do seu produto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      height: 1.3,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF560955)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                child: Text(
                  'Certifique-se que seu produto \n esteja centralizado, com foco e em \n um ambiente bem iluminado.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF4D0351),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Manrope',
                      height: 1.1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 123, left: 44, right: 46),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      alignment: Alignment.center,
                      primary: Color(0xFF22AB86),
                      fixedSize: Size(324, 60),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2.0, color: Color(0Xff006633)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (AppHelpers.isInternetActive) {
                        await executeGaleryPhotosAction();
                      } else {
                        Navigator.of(context).pushNamed('/internet-connection', arguments: {
                          'executeAction': executeGaleryPhotosAction,
                        });
                      }
                    },
                    child: Text(
                      'Escolher da Galeria',
                      style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45),
              padding: EdgeInsets.only(top: 30, bottom: 80, left: 45, right: 45),
              height: 170,
              color: Color.fromRGBO(180, 216, 216, 0.2),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    alignment: Alignment.center,
                    primary: Color(0xFF22AB86),
                    fixedSize: Size(324, 60),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.0, color: Color(0xFF006633)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (AppHelpers.isInternetActive) {
                      await executeCameraPhotosAction();
                    } else {
                      Navigator.of(context).pushNamed('/internet-connection', arguments: {
                        'executeAction': executeCameraPhotosAction,
                      });
                    }
                  },
                  child: Text(
                    'Tirar foto',
                    style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> executeCameraPhotosAction() async {
    var imagePath = await takePhotoFromCamera();

    if (imagePath.isNotEmpty) {
      productModel.productImages!
        ..clear()
        ..add(imagePath);

      Navigator.of(context).pushNamed(
        '/product/products_announcement/product_photo_confirmation',
        arguments: {
          'productAnnouncementRequestModel': productModel,
        },
      );
    }
  }

  Future<void> executeGaleryPhotosAction() async {
    var imagePath = await getImageFromGalery();

    if (imagePath.isNotEmpty) {
      productModel.productImages!
        ..clear()
        ..add(imagePath);
      Navigator.of(context).pushNamed(
        '/product/products_announcement/product_photo_confirmation',
        arguments: {
          'productAnnouncementRequestModel': productModel,
        },
      );
    }
  }
}
