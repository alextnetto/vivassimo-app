class DeliveryAddressEntity {
  final int id;
  final String? street;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? uf;
  final String? cep;

  DeliveryAddressEntity({required this.id, this.street, this.number, this.neighborhood, this.city, this.uf, this.cep});
}
