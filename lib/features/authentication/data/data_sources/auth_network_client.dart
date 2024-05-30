import 'package:dio/dio.dart';
import 'package:memory_minder_app/features/authentication/data/models/response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_network_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(
    Dio dio,
  ) = _AuthApiClient;

  @POST("auth/sign-up")
  Future<ResponseModel> signUp(@Body() Map<String, dynamic> body);

  @POST("user/check-account")
  Future<dynamic> checkAccount(@Body() Map<String, dynamic> body);

  @PUT("user/verify-code")
  Future<dynamic> sendVerifyCode(@Body() Map<String, dynamic> body);

  @GET("user/profile")
  Future<dynamic> getUserProfile(@Query("id") String id);

  @DELETE("user/delete-account")
  Future<dynamic> deleteAccount(@Body() Map<String, dynamic> body);
}
