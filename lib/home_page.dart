import 'package:flutter/material.dart';
import 'package:my_app/components/button_1.dart';
import 'package:my_app/components/text_style.dart';
import 'package:my_app/config/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int themeCounter = 1;
  bool isDarkTheme = false;

  changeThemeCounter() {
    if (themeCounter < 7) {
      setState(() {
        themeCounter++;
      });
    } else {
      setState(() {
        themeCounter = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home_bg_$themeCounter.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/home_senior_$themeCounter.png',
                      height: MediaQuery.of(context).size.height / 2.4,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: changeThemeCounter,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 20),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      width: 324,
                      height: 60,
                      child: CustomButton1(
                          label: 'Já tenho uma conta',
                          primary: themeCounter == 5
                              ? VivassimoTheme.white
                              : VivassimoTheme.purple,
                          onPrimary: themeCounter == 5
                              ? VivassimoTheme.purple
                              : VivassimoTheme.white,
                          borderColor: themeCounter == 5
                              ? VivassimoTheme.white
                              : VivassimoTheme.purple,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      width: 324,
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/register/acceptTerms');
                        },
                        child: Text(
                          'Não tenho uma conta',
                          style: customTextStyle(
                            FontWeight.w700,
                            23,
                            themeCounter == 2 || themeCounter == 3
                                ? VivassimoTheme.purple
                                : VivassimoTheme.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 2.0,
                            color: themeCounter == 2 || themeCounter == 3
                                ? VivassimoTheme.purple
                                : VivassimoTheme.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
