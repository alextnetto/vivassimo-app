import 'package:flutter/material.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';

class AcceptRegisterTermsScreen extends StatefulWidget {
  const AcceptRegisterTermsScreen({Key? key}) : super(key: key);

  @override
  State<AcceptRegisterTermsScreen> createState() => _AcceptRegisterTermsScreenState();
}

class _AcceptRegisterTermsScreenState extends State<AcceptRegisterTermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: 'registerAppBar',
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Column(
                  children: const [
                    AppBarDefaultWidget(title: 'Criar uma conta'),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Aceitar Termos de Uso',
                    style: customTextStyle(
                      FontWeight.w700,
                      23,
                      VivassimoTheme.purpleActive,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 324,
                    child: Text(
                      'Ao continuar o cadastro você estará aceitando nossos termos de uso',
                      style: customTextStyle(
                        FontWeight.w700,
                        18,
                        VivassimoTheme.purpleActive,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: 324,
                      height: 60,
                      child: CustomButton1(
                          label: 'Ler os termos de uso',
                          primary: VivassimoTheme.ice,
                          onPrimary: VivassimoTheme.grey,
                          borderColor: VivassimoTheme.blue,
                          onPressed: () {
                            if (AppHelpers.isInternetActive) {
                              executeTermsAction();
                            } else {
                              Navigator.of(context).pushNamed('/internet-connection', arguments: {
                                'executeAction': executeTermsAction,
                              });
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Hero(
              tag: 'registerButtonConfirm',
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonConfirm(
                  label: 'Continuar',
                  primary: VivassimoTheme.green,
                  textColor: VivassimoTheme.white,
                  borderColor: Color(0xff006633),
                  onPressed: () {
                    if (AppHelpers.isInternetActive) {
                      executeRedirectRegisterAction();
                    } else {
                      Navigator.of(context).pushNamed('/internet-connection', arguments: {
                        'executeAction': executeRedirectRegisterAction,
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  executeRedirectRegisterAction() {
    Navigator.of(context).pushNamed('/register/1');
  }

  executeTermsAction() {
    Navigator.of(context).pushNamed('/register/terms');
  }
}
