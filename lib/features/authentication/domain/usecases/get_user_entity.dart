import 'package:fpdart/fpdart.dart';
import 'package:memory_minder_app/core/error/failure.dart';
import 'package:memory_minder_app/core/usercase/usecase.dart';
import 'package:memory_minder_app/features/authentication/domain/entities/user_entity.dart';
import 'package:memory_minder_app/features/authentication/domain/repositories/auth_respository.dart';

class GetUserEntity implements UseCase<UserEntity, Prams> {
  final AuthRepository authRepository;

  GetUserEntity(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(Prams prams) async {
    return await authRepository.getuser(prams.id);
  }
}

class Prams {
  final String id;
  Prams({required this.id});
}
