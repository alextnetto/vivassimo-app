class DeliveryAddressEntity {
  final int id;
  final String? street;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? uf;
  final String? cep;
  final String? complement;

  DeliveryAddressEntity(
      {required this.id,
      this.street,
      this.number,
      this.neighborhood = '',
      this.city,
      this.uf,
      this.cep,
      this.complement = ''});
}
