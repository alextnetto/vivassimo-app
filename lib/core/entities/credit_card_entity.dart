class CreditCardEntity {
  int? id;
  String? ownerName;
  String? number;
  String? expireDate;
  String? cvv;
  String? imagePath;

  CreditCardEntity({
    this.id,
    this.ownerName,
    this.number,
    this.expireDate,
    this.cvv,
    this.imagePath,
  });
}
