import 'package:fpdart/fpdart.dart';
import 'package:memory_minder_app/core/error/failure.dart';
import 'package:memory_minder_app/core/api/api_util.dart';
import 'package:memory_minder_app/features/authentication/data/data_sources/auth_network_client.dart';
import 'package:memory_minder_app/features/authentication/domain/entities/user_entity.dart';
import 'package:memory_minder_app/features/authentication/domain/repositories/auth_respository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_respository_impl.g.dart';

class AuthRepositoryImp implements AuthRepository {
  late AuthApiClient _authApiClient;

  AuthRepositoryImp() {
    _authApiClient = AuthApiClient(CoreApiUtil().getDio());
  }

  @override
  Future<Either<Failure, UserEntity>> getuser(String number) {
    return Future.value(const Left(Failure.empty()));
  }
}

@Riverpod(keepAlive: true)
AuthRepositoryImp authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImp();
}
