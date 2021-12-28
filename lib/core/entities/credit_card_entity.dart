import 'package:equatable/equatable.dart';
import 'package:my_app/core/utils/enums/credit_card_enum.dart';

// ignore: must_be_immutable
class CreditCardEntity extends Equatable {
  int? id;
  String? ownerName;
  String? number;
  String? expirationDate;
  String? cvv;
  String? imagePath;
  String? imagePathWhite;
  CardBrand? brand;
  String? brandName;

  CreditCardEntity({
    this.id,
    this.ownerName,
    this.number,
    this.expirationDate,
    this.cvv,
    this.imagePath,
    this.imagePathWhite,
    this.brand,
    this.brandName,
  });

  @override
  List<Object?> get props => [
        id,
        ownerName,
        number,
        expirationDate,
        cvv,
        imagePath,
        imagePathWhite,
        brand,
        brandName,
      ];
}
