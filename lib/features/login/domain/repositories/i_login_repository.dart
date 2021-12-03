import 'package:dartz/dartz.dart';
import 'package:my_app/features/login/domain/entities/login_entity.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

abstract class ILoginRepository {
  Future<Either<LoginError, LoginEntity>> login(
      LoginRequestModel loginRequestModel);
}
