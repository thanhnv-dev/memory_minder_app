import 'package:fpdart/fpdart.dart';
import 'package:memory_minder_app/core/error/failure.dart';
import 'package:memory_minder_app/core/network/network_util.dart';
import 'package:memory_minder_app/features/authentication/data/data_sources/auth_network_client.dart';
import 'package:memory_minder_app/features/authentication/domain/entities/user_entity.dart';
import 'package:memory_minder_app/features/authentication/domain/repositories/auth_respository.dart';

abstract class AuthRepositoryImp implements AuthRepository {
  late AuthApiClient _authApiClient;

  AuthRepositoryImp() {
    _authApiClient = AuthApiClient(CoreApiUtil().getDio(),
        baseUrl: 'https://server-jobs-pot.vercel.app/');
  }

  @override
  Future<Either<Failure, UserEntity>> getuser(String number) {
    return Future.value(const Left(Failure.empty()));
  }
}
