import 'package:equatable/equatable.dart';

class StoreEntity extends Equatable {
  final String name;
  final String description;
  final String imagePath;

  const StoreEntity({required this.name, required this.description, required this.imagePath});

  @override
  List<Object?> get props => [name, description, imagePath];
}
