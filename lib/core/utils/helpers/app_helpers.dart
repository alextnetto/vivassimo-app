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
}
