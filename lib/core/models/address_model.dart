import 'dart:convert';

class AddressModel {
  int? id;
  String? street;
  String? number;
  String? neighborhood;
  String? city;
  String? state;
  String? zipCode;
  String? complement;

  AddressModel({
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

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
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

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
