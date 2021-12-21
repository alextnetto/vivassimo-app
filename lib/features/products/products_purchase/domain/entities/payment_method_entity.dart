class PaymentMethodEntity {
  int? id;
  String? name;
  int? installments;
  num? installmentAmount;
  String? description;
  String? image;

  PaymentMethodEntity({
    this.id,
    this.name,
    this.installments,
    this.installmentAmount,
    this.image,
  });
}
