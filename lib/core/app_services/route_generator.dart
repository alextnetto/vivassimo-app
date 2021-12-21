import 'package:flutter/material.dart';
import 'package:my_app/features/home/presentation/screens/home_screen.dart';
import 'package:my_app/features/home/presentation/screens/product_category_screen.dart';
import 'package:my_app/features/login/presentation/screens/login_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/delete_delivery_address_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/delete_payment_method_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/delivery_address_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/new_delivery_address_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/payment_method_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/product_purchase_details_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/product_purchase_success_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/shipping_method_screen.dart';
import 'package:my_app/features/register/presentation/screens/accept_terms_screen.dart';
import 'package:my_app/features/register/presentation/screens/otp_screen.dart';
import 'package:my_app/features/register/presentation/screens/password_screen.dart';
import 'package:my_app/features/register/presentation/screens/register_step_one_screen.dart';
import 'package:my_app/features/register/presentation/screens/register_terms_screen.dart';
import 'package:my_app/features/services/services_purchase/presentation/screens/service_type_description_screen.dart';
import 'package:my_app/pages/register/address2_page.dart';
import 'package:my_app/features/register/presentation/screens/address_step_one_screen.dart';
import 'package:my_app/features/register/presentation/screens/cpf_screen.dart';
import 'package:my_app/features/register/presentation/screens/register_step_two_screen.dart';
import 'package:my_app/pages/register/register_finished.dart';
import '../../home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args;
    if (settings.arguments != null) args = settings.arguments as Map;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => SignInOrSignUpRedirectScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/login':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case '/home/product-category':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ProductCategoryScreen());

      case '/products/products_purchase/delivery_address':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => DeliveryAddressScreen());

      case '/products/products_purchase/new_delivery_address':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) =>
                NewDeliveryAddressScreen(deliveryStore: args['deliveryStore']));

      case '/products/products_purchase/delete_delivery_address':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => DeleteDeliveryAddressScreen());

      case '/products/products_purchase/shipping_method':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ShippingMethodScreen());

      case '/products/products_purchase/payment_method':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => PaymentMethodScreen());

      case '/products/products_purchase/delete_payment_method':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => DeletePaymentMethodScreen());

      case '/products/products_purchase/product_purchase_details':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => ProductPurchaseDetailsScreen());

      case '/products/products_purchase/product_purchase_success':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => ProductPurchaseSuccessScreen());

      case '/product/product-details':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => ServiceTypeDescriptionScreen());

      case '/register/acceptTerms':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => AcceptRegisterTermsScreen());

      case '/register/terms':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => TermsScreen());

      case '/register/1':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => RegisterStepOneScreen());

      case '/register/verifyOtp':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => OtpVerificationPage(
                  registerUserRequestModel: args['registerUserRequestModel'],
                ));

      case '/register/password':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => PasswordScreen(
                  registerUserRequestModel: args['registerUserRequestModel'],
                ));

      case '/register/cpf':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => CpfScreen(
                  registerUserRequestModel: args['registerUserRequestModel'],
                ));

      case '/register/2':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => RegisterStepTwoScreen(
                  registerUserRequestModel: args['registerUserRequestModel'],
                ));

      case '/register/address1':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => AddressStepOneScreen(
                  registerUserRequestModel: args['registerUserRequestModel'],
                ));

      case '/register/address2':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => EstadoScreen());

      case '/register/registerFinished':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => RegisterFinishedScreen());

      // case '/verifyCode':
      //   return MaterialPageRoute(
      //     builder: (_) => VerifyCodeScreen(
      //       tipoToken: args["tipoToken"],
      //       telefone: args["telefone"],
      //       email: args["email"],
      //     ),
      //   );

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
