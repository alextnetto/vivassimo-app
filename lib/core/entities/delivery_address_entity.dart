import 'dart:convert';

class AddressEntity {
  final int? id;
  final String? street;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? complement;

  AddressEntity({
    this.id,
    this.street,
    this.number,
    this.neighborhood,
    this.city,
    this.state,
    this.zipCode,
    this.complement,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'complement': complement,
    };
  }

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      id: map['id']?.toInt(),
      street: map['street'],
      number: map['number'],
      neighborhood: map['neighborhood'],
      city: map['city'],
      state: map['state'],
      zipCode: map['zipCode'],
      complement: map['complement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) => AddressEntity.fromMap(json.decode(source));
}
