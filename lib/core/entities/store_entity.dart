import 'package:equatable/equatable.dart';

class StoreEntity extends Equatable {
  final String name;
  final String? description;
  final String imagePath;
  final String? rate;
  final String? kmDistance;
  final String? deliveryTime;
  final double? deliveryFee;
  final Function()? onPressed;

  const StoreEntity(
      {this.rate,
      this.kmDistance,
      this.onPressed,
      this.deliveryTime,
      this.deliveryFee,
      required this.name,
      this.description,
      required this.imagePath});

  @override
  List<Object?> get props => [name, description, imagePath, rate, kmDistance, deliveryFee, deliveryTime, onPressed];
}
