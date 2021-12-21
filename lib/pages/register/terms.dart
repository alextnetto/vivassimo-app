import 'package:flutter/material.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/app_style.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: VivassimoTheme.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Hero(
                  tag: 'registerAppBar',
                  child: Container(
                    height: 130,
                    color: VivassimoTheme.white,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 40,
                        ),
                        AppBarDefaultWidget(title: 'Criar uma conta'),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     ButtonBack(),
                        //     // texto
                        //     Padding(
                        //       padding: const EdgeInsets.only(right: 30),
                        //       child: Text(
                        //         'Criar uma conta',
                        //         style: customTextStyle(
                        //           FontWeight.w700,
                        //           18,
                        //           VivassimoTheme.purpleActive,
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Termos de Uso',
                        style: customTextStyle(
                          FontWeight.w700,
                          23,
                          VivassimoTheme.purpleActive,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 350,
                          color: VivassimoTheme.ice,
                          child: ListView(
                            padding: EdgeInsets.all(24),
                            children: [
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident. ',
                                style: customTextStyle(
                                  FontWeight.w600,
                                  17,
                                  VivassimoTheme.purpleActive,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Hero(
            tag: 'registerButtonConfirm',
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonConfirm(
                label: 'Continuar',
                primary: VivassimoTheme.green,
                textColor: VivassimoTheme.white,
                borderColor: VivassimoTheme.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
