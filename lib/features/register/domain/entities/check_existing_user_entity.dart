import 'package:equatable/equatable.dart';

class CheckExistingUserEntity extends Equatable {
  final String phoneNumber;

  const CheckExistingUserEntity({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
