import 'dart:convert';

class DeliveryAddressEntity {
  final int? id;
  final String? street;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? uf;
  final String? cep;
  final String? complement;

  DeliveryAddressEntity({
    this.id,
    this.street,
    this.number,
    this.neighborhood,
    this.city,
    this.uf,
    this.cep,
    this.complement,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'city': city,
      'uf': uf,
      'cep': cep,
      'complement': complement,
    };
  }

  factory DeliveryAddressEntity.fromMap(Map<String, dynamic> map) {
    return DeliveryAddressEntity(
      id: map['id']?.toInt(),
      street: map['street'],
      number: map['number'],
      neighborhood: map['neighborhood'],
      city: map['city'],
      uf: map['uf'],
      cep: map['cep'],
      complement: map['complement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAddressEntity.fromJson(String source) =>
      DeliveryAddressEntity.fromMap(json.decode(source));
}
