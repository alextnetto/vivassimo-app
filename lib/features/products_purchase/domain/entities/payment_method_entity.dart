class PaymentMethodEntity {
  int? id;
  String? name;
  String? imagePath;
  int? installments;
  num? installmentAmount;
  String? description;
  String? brandName;

  PaymentMethodEntity({
    this.id,
    this.name,
    this.imagePath,
    this.installments,
    this.installmentAmount,
    this.brandName,
  });
}
