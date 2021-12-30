import 'package:flutter/material.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/components/bottom_navigator_bar_app.dart';
import 'package:my_app/core/ui/widgets/button_1.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';

class InternetConnectionFailureScreen extends StatefulWidget {
  final Function() executeAction;

  const InternetConnectionFailureScreen({Key? key, required this.executeAction}) : super(key: key);

  @override
  _InternetConnectionFailureScreenState createState() => _InternetConnectionFailureScreenState();
}

class _InternetConnectionFailureScreenState extends State<InternetConnectionFailureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(top: 70),
                height: 262,
                width: 198,
                child: Image.asset('assets/images/internet_connection.png')),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Text(
              'Falha na conexão \n à internet',
              textAlign: TextAlign.center,
              style: customTextStyle(FontWeight.w800, 30, VivassimoTheme.purple, lineHeight: 1),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Text(
              'Verifique sua rede \n e tente novamente',
              textAlign: TextAlign.center,
              style: customTextStyle(FontWeight.w700, 23, VivassimoTheme.purple),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                padding: EdgeInsets.only(left: 45, right: 45),
                width: double.infinity,
                height: 60,
                child: CustomButton1(
                  label: 'Tentar novamente',
                  primary: VivassimoTheme.green,
                  onPrimary: VivassimoTheme.white,
                  borderColor: Color(0xff006633),
                  onPressed: () {
                    if (AppHelpers.isInternetActive) {
                      widget.executeAction();
                    } else {
                      AppHelpers.showToast(context, 'Você ainda está sem internet');
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigatorBarApp(selectedIndex: 1),
    );
  }
}
