import 'package:flutter/material.dart';
import 'package:my_app/core/utils/enums/credit_card_enum.dart';

class AppHelpers {
  static String getCredtiCardLogo(CardBrand brand) {
    switch (brand) {
      case CardBrand.otherBrand:
        return '';
      case CardBrand.mastercard:
        return 'assets/icon/payment_methods_icons/mastercard.png';
      case CardBrand.visa:
        return 'assets/icon/payment_methods_icons/visa.png';
      case CardBrand.americanExpress:
        return 'assets/icon/payment_methods_icons/amex.png';
      default:
        return '';
    }
  }

  static String getCredtiCardLogoWhite(CardBrand brand) {
    switch (brand) {
      case CardBrand.otherBrand:
        return '';
      case CardBrand.mastercard:
        return 'assets/icon/payment_methods_icons/mastercard.png';
      case CardBrand.visa:
        return 'assets/icon/payment_methods_icons/visa_logo_white.png';
      case CardBrand.americanExpress:
        return 'assets/icon/payment_methods_icons/amex.png';
      default:
        return '';
    }
  }

  static String getCreditCardBrandName(CardBrand brand) {
    switch (brand) {
      case CardBrand.otherBrand:
        return '';
      case CardBrand.mastercard:
        return 'Mastercard';
      case CardBrand.visa:
        return 'Visa';
      case CardBrand.americanExpress:
        return 'Amex';
      default:
        return '';
    }
  }

  static String formatItemToDropDown(String value) {
    return 'Cartão final ${value.substring(value.length - 4, value.length)}';
  }

  static void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
        // margin:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.6),
        width: MediaQuery.of(context).size.width * 0.8,
        duration: Duration(seconds: 3),
        content: Text(
          'Código enviado com sucesso',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        // action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
