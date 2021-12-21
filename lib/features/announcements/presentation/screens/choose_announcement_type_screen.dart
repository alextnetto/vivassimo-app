import 'package:flutter/material.dart';

class ChooseAnnouncementTypeScreen extends StatefulWidget {
  const ChooseAnnouncementTypeScreen({Key? key}) : super(key: key);

  @override
  _ChooseAnnouncementTypeScreenState createState() => _ChooseAnnouncementTypeScreenState();
}

class _ChooseAnnouncementTypeScreenState extends State<ChooseAnnouncementTypeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      alignment: AlignmentDirectional.center,
                      primary: Color(0xFF4D0351),
                      fixedSize: Size(140, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10)))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Voltar",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Anunciar',
                        style: TextStyle(color: Color(0xFF4D0351), fontSize: 18.0, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 42, right: 90, left: 90),
            child: SizedBox(
              child: Text(
                'O que você \n deseja anunciar?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF560955), fontWeight: FontWeight.w800, fontSize: 26),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/product/products_announcement/product_category');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 43, left: 45, right: 45),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFF3399CC), borderRadius: BorderRadius.circular(10)),
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15),
                      child: Row(
                        children: [
                          Text(
                            'Anunciar \num Produto',
                            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Image.asset('assets/images/announcement/announce_card_0.png'))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/product/products_announcement/product_category');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 43, left: 45, right: 45),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFFFFB640), borderRadius: BorderRadius.circular(10)),
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Anunciar \num Serviço',
                              style: TextStyle(color: Color(0xFF4D0351), fontSize: 23, fontWeight: FontWeight.w700)),
                          Image.asset('assets/images/announcement/announce_card_1.png')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
