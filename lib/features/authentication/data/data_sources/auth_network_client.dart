import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_network_client.g.dart';

@RestApi(baseUrl: 'https://server-jobs-pot.vercel.app/')
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  @POST("user/check-account")
  Future<dynamic> checkAccount(@Body() Map<String, dynamic> body);

  @PUT("user/verify-code")
  Future<dynamic> sendVerifyCode(@Body() Map<String, dynamic> body);

  @GET("user/profile")
  Future<dynamic> getUserProfile(@Query("id") String id);

  @DELETE("user/delete-account")
  Future<dynamic> deleteAccount(@Body() Map<String, dynamic> body);
}
