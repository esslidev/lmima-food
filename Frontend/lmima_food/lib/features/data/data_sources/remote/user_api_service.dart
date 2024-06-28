import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../models/data_response.dart';
import '../../models/user_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @GET("/api/users/getUser")
  Future<HttpResponse<DataResponse<UserModel>>> getUser({
    @Header("Authorization") required String accessToken,
    @Header('Content-Type') String contentType = 'application/json',
  });

  @GET("/api/users/getUsers")
  Future<HttpResponse<DataResponse<List<UserModel>>>> getUsers({
    @Header("Authorization") required String accessToken,
    @Query('orderByAlphabets') bool? orderByAlphabets,
    @Query('search') String? search,
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Header('Content-Type') String contentType = 'application/json',
  });
}
