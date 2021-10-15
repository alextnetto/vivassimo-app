import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/app_controller.dart';
import 'package:my_app/components/button_purple.dart';
import 'package:my_app/config/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  bool isDarkTheme = false;
  int seniorImage = 1;

  changeSeniorImage() {
    if (seniorImage < 7) {
      setState(() {
        seniorImage++;
      });
    } else {
      setState(() {
        seniorImage = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                VivassimoTheme.gradientMainBegin,
                VivassimoTheme.gradientMainEnd
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: Image.asset(
                  'assets/images/senior_0$seniorImage.png',
                  height: 350,
                  fit: BoxFit.scaleDown,
                ),
                onTap: changeSeniorImage,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  width: 324,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Já tenho uma conta',
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
                          color: VivassimoTheme.white,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 2.0,
                        color: VivassimoTheme.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  width: 324,
                  height: 60,
                  child: ButtonPurple(
                      label: 'Não tenho uma conta',
                      primary: VivassimoTheme.purpleActive,
                      onPrimary: VivassimoTheme.white,
                      borderColor: VivassimoTheme.red,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register/1');
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
