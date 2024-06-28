import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../models/auth_response.dart';
import '../../models/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST("/api/auth/adminSignIn")
  Future<HttpResponse<AuthResponseModel>> signIn({
    @Header("apiKey") required String apiKey,
    @Body() required UserModel user,
    @Header('Content-Type') String contentType = 'application/json',
  });

  @POST("/api/auth/renewAccess")
  Future<HttpResponse<AuthResponseModel>> renewAccess({
    @Header("apiKey") required String apiKey,
    @Header("renewToken") required String renewToken,
    @Header('Content-Type') String contentType = 'application/json',
  });
}
