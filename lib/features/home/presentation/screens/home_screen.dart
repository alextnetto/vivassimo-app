import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/backgrounds/Vector.png'),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0.25)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/logos/vivassimo_logo.png'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Color(0xFFFFB640),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/localization_icon.png'),
                      SizedBox(width: 10),
                      Text(
                        'Av. Paulista, 930',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 0, bottom: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite um produto ou serviço',
                      hintStyle: TextStyle(
                        color: Color(0xFF4D0351),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Image.asset('assets/icons/search_icon.png'),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff4D0351),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff4D0351),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff4D0351),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        height: 177,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                            // child: Container(
                            //   // height: 177,
                            //   // width: 100,
                            // ),
                            ),
                      ),
                      SizedBox(
                        height: 177,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                            // child: Container(
                            //   // height: 177,
                            //   // width: 100,
                            // ),
                            ),
                      ),
                      SizedBox(
                        height: 177,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                            // child: Container(
                            //   // height: 177,
                            //   // width: 100,
                            // ),
                            ),
                      ),
                    ],
                  ),
                ),
                // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)

                // Expanded(
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       SizedBox(
                //         height: 177,
                //         width: MediaQuery.of(context).size.width * 0.6,
                //         child: Card(
                //             // child: Container(
                //             //   // height: 177,
                //             //   // width: 100,
                //             // ),
                //             ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
