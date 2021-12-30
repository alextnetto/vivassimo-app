import 'package:equatable/equatable.dart';

class CheckExistingUserEntity extends Equatable {
  final bool? userExists;

  const CheckExistingUserEntity({required this.userExists});

  @override
  List<Object?> get props => [userExists];
}
