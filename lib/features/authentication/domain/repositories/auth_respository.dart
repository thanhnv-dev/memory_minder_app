import 'package:fpdart/fpdart.dart';
import 'package:memory_minder_app/core/error/failure.dart';
import 'package:memory_minder_app/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp(String email, String password);
}
