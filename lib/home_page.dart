import 'package:flutter/material.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'core/services/analytics_service.dart';

class SignInOrSignUpRedirectScreen extends StatefulWidget {
  const SignInOrSignUpRedirectScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignInOrSignUpRedirectScreenState();
  }
}

class SignInOrSignUpRedirectScreenState extends State<SignInOrSignUpRedirectScreen> {
  int themeCounter = 1;
  bool isDarkTheme = false;

  changeThemeCounter() {
    if (themeCounter < 5) {
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
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/home_senior_$themeCounter.png',
                      height: MediaQuery.of(context).size.height / 2.3,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: changeThemeCounter,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 40),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(
                    width: 324,
                    height: 60,
                    child: CustomButton1(
                        label: 'Já tenho uma conta',
                        primary: VivassimoTheme.purple,
                        onPrimary: VivassimoTheme.white,
                        borderColor: VivassimoTheme.purple,
                        onPressed: () async {
                          await AnalyticsService.setEventLogin();
                          Navigator.of(context).pushNamed('/login');
                        }),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 324,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register/acceptTerms');
                      },
                      child: Text(
                        'Não tenho uma conta',
                        style: customTextStyle(
                          FontWeight.w700,
                          23,
                          themeCounter == 2 || themeCounter == 3 ? VivassimoTheme.purple : VivassimoTheme.white,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2.0,
                          color: themeCounter == 2 || themeCounter == 3 ? VivassimoTheme.purple : VivassimoTheme.white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
