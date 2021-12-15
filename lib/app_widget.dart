import 'package:flutter/material.dart';
import 'package:my_app/app_controller.dart';
import 'package:my_app/features/home/presentation/screens/home_screen.dart';
import 'package:my_app/features/login/presentation/screens/login_screen.dart';
import 'package:my_app/pages/register/address2_page.dart';
import 'package:my_app/pages/register/address_1.dart';
import 'package:my_app/pages/register/cpf_page.dart';
import 'package:my_app/pages/register/accept_terms.dart';
import 'package:my_app/pages/register/register_1.dart';
import 'package:my_app/pages/register/password.dart';
import 'package:my_app/pages/register/register_2.dart';
import 'package:my_app/pages/register/register_finished.dart';
import 'package:my_app/pages/register/terms.dart';
import 'package:my_app/pages/register/otp_verification.dart';

import 'core/app_services/route_generator.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/home/presentation/screens/product_category_screen.dart';
import 'features/products/products_purchase/presentation/screens/delete_delivery_address_screen.dart';
import 'features/products/products_purchase/presentation/screens/delete_payment_method_screen.dart';
import 'features/products/products_purchase/presentation/screens/delivery_address_screen.dart';
import 'features/products/products_purchase/presentation/screens/new_delivery_address_screen.dart';
import 'features/products/products_purchase/presentation/screens/payment_method_screen.dart';
import 'features/products/products_purchase/presentation/screens/product_purchase_details_screen.dart';
import 'features/products/products_purchase/presentation/screens/product_purchase_success_screen.dart';
import 'features/products/products_purchase/presentation/screens/shipping_method_screen.dart';
import 'features/services/services_purchase/presentation/screens/service_type_description_screen.dart';
import 'home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return Material(
          type: MaterialType.transparency,
          child: MaterialApp(
            title: 'Vivassimo',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            // routes: {
            //   '/': (context) => SignInOrSignUpRedirectScreen(),
            //   // '/': (context) => DeliveryAddressScreen(),
            //   '/home': (context) => HomeScreen(),
            //   '/home/product-category': (context) => ProductCategoryScreen(),
            //   '/products/products_purchase/delivery_address': (context) => DeliveryAddressScreen(),
            //   '/products/products_purchase/new_delivery_address': (context) => NewDeliveryAddressScreen(),
            //   '/products/products_purchase/delete_delivery_address': (context) => DeleteDeliveryAddressScreen(),
            //   '/products/products_purchase/shipping_method': (context) => ShippingMethodScreen(),
            //   '/products/products_purchase/payment_method': (context) => PaymentMethodScreen(),
            //   '/products/products_purchase/delete_payment_method': (context) => DeletePaymentMethodScreen(),
            //   '/products/products_purchase/product_purchase_details': (context) => ProductPurchaseDetailsScreen(),
            //   '/products/products_purchase/product_purchase_success': (context) => ProductPurchaseSuccessScreen(),
            //   '/register/address2': (context) => EstadoScreen(),
            //   '/product/product-details': (context) => ServiceTypeDescriptionScreen(),
            //   '/register/acceptTerms': (context) => RegisterTerms(),
            //   '/register/terms': (context) => TermsPage(),
            //   '/register/verifyOtp': (context) => OtpVerificationScreen(),
            //   '/register/1': (context) => RegisterStepOneScreen(),
            //   '/register/2': (context) => RegisterStepTwoScreen(),
            //   '/register/password': (context) => PasswordScreen(),
            //   '/register/cpf': (context) => CpfScreen(),
            //   '/register/address1': (context) => AddressStepOneScreen(),
            //   '/register/registerFinished': (context) => RegisterFinishedScreen(),
            //   '/login': (context) => LoginScreen(),
            // },
          ),
        );
      },
    );
  }
}
