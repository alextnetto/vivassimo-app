import 'package:flutter/material.dart';
import 'package:my_app/features/announcements/presentation/screens/my_announcements_screen.dart';
import 'package:my_app/features/announcements/presentation/screens/choose_announcement_type_screen.dart';
import 'package:my_app/features/home/presentation/screens/home_screen.dart';
import 'package:my_app/features/home/presentation/screens/product_category_screen.dart';
import 'package:my_app/features/login/presentation/screens/login_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_announcement_success_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_photos_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_description_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_new_or_used_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_announcement_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_category_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_photo_confirmation_screen.dart';
import 'package:my_app/features/products/products_announcement/presentation/screens/product_announcement_review_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/delete_delivery_address_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/delete_payment_method_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/delivery_address_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/new_delivery_address_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/payment_method_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/product_purchase_details_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/product_purchase_success_screen.dart';
import 'package:my_app/features/products/products_purchase/presentation/screens/shipping_method_screen.dart';
import 'package:my_app/features/services/services_purchase/presentation/screens/service_type_description_screen.dart';
import 'package:my_app/pages/register/accept_terms.dart';
import 'package:my_app/pages/register/address2_page.dart';
import 'package:my_app/pages/register/address_1.dart';
import 'package:my_app/pages/register/cpf_page.dart';
import 'package:my_app/pages/register/otp_verification.dart';
import 'package:my_app/pages/register/password.dart';
import 'package:my_app/pages/register/register_1.dart';
import 'package:my_app/pages/register/register_2.dart';
import 'package:my_app/pages/register/register_finished.dart';
import 'package:my_app/pages/register/terms.dart';

import '../../features/signin_signup_redirect_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: prefer_typing_uninitialized_variables
    var args;
    if (settings.arguments != null) args = settings.arguments as Map;

    switch (settings.name) {
      case '/sign_or_signup':
        return MaterialPageRoute(
            builder: (_) => SignInOrSignUpRedirectScreen(
                  redirectTo: args['redirectTo'],
                ));

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/login':
        // if (args is String) {
        return MaterialPageRoute(
          builder: (_) => LoginScreen(
            redirectTo: args['redirectTo'],
          ),
        );

      case '/home/product-category':
        // if (args is String) {
        return MaterialPageRoute(
          builder: (_) => ProductCategoryScreen(
            index: args['index'],
          ),
        );

      case '/products/products_purchase/delivery_address':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => DeliveryAddressScreen());

      case '/products/products_purchase/new_delivery_address':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => NewDeliveryAddressScreen(deliveryStore: args['deliveryStore']));

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
        return MaterialPageRoute(builder: (_) => ProductPurchaseDetailsScreen());

      case '/products/products_purchase/product_purchase_success':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ProductPurchaseSuccessScreen());

      case '/register/address2':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => EstadoScreen());

      case '/product/product-details':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ServiceTypeDescriptionScreen());

      case '/register/acceptTerms':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => RegisterTerms());

      case '/register/terms':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => TermsPage());

      case '/register/verifyOtp':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => OtpVerificationScreen());

      case '/register/1':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => RegisterStepOneScreen());

      case '/register/2':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => RegisterStepTwoScreen());

      case '/register/password':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => PasswordScreen());

      case '/register/cpf':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => CpfScreen());

      case '/register/address1':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => AddressStepOneScreen());

      case '/register/registerFinished':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => RegisterFinishedScreen());

      case '/product/products_announcement/product_category':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ProductAnnouncementCategoryScreen());

      case '/product/products_announcement/product_announcement_info':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => ProductAnnouncementInfoScreen(
                  categoryEntity: args['model'],
                ));

      case '/product/products_announcement/product_new_or_used':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ProductNewOrUsedScreen());

      case '/product/products_announcement/product_description':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ProductDescriptionScreen());

      case '/product/products_announcement/product_photos':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ProductPhotosScreen());

      case '/product/products_announcement/product_photo_confirmation':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => ProductPhotoConfirmationScreen(
                  productPhotoTaken: args['imagePath'],
                ));

      case '/product/products_announcement/product_announcement_review':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => ProductAnnouncementReviewScreen(
                  img: args['img'],
                ));

      case '/product/products_announcement/produc_announcement_success':
        // if (args is String) {
        return MaterialPageRoute(
            builder: (_) => ProductAnnouncementSuccessScreen(
                  img: args['img'],
                ));

      case '/announcements/my_announcements':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => MyAnnouncementsScreen());

      case '/announcements/choose_announcement':
        // if (args is String) {
        return MaterialPageRoute(builder: (_) => ChooseAnnouncementTypeScreen());

      // case '/verifyCode':
      //   return MaterialPageRoute(
      //     builder: (_) => VerifyCodeScreen(
      //       tipoToken: args["tipoToken"],
      //       telefone: args["telefone"],
      //       email: args["email"],
      //     ),
      //   );

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
