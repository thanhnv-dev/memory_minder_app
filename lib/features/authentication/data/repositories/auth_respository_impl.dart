import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fpdart/fpdart.dart';
import 'package:memory_minder_app/core/error/failure.dart';
import 'package:memory_minder_app/core/api/api_util.dart';
import 'package:memory_minder_app/features/authentication/data/data_sources/auth_network_client.dart';
import 'package:memory_minder_app/features/authentication/data/models/response_model.dart';
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
  Future<Either<Failure, UserEntity>> signUp(String email, String password) async {
    try {
      final Map<String, String> body = {
        "email": email,
        "password": password,
      };

      ResponseModel res = await _authApiClient.signUp(body);

      return right(UserEntity.fromJson(res.data));
    } on DioException catch (e) {
      dynamic data = e.response?.data;

      if (data != null) {
        ResponseModel resError = ResponseModel.fromJson(data);
        return left(Failure.message(message: resError.message));
      }

      return left(const Failure.empty());
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepositoryImp authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImp();
}
