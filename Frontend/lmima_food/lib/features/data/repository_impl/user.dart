import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/resources/data_state.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user.dart';
import '../data_sources/remote/user_api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<DataState<UserEntity>> getUser({
    required String accessToken,
  }) async {
    try {
      final httpResponse = await _userApiService.getUser(
        accessToken: accessToken,
      );

      print('http response >> ${httpResponse.data.data}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      print('catched error >> ${e.toString()}');
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<UserEntity>>> getUsers(
      {required String accessToken,
      bool orderByAlphabets = false,
      String? search,
      int limit = 10,
      int page = 1}) async {
    try {
      final httpResponse = await _userApiService.getUsers(
        accessToken: accessToken,
        orderByAlphabets: orderByAlphabets,
        search: search,
        limit: limit,
        page: page,
      );

      print('http response >> ${httpResponse.data.data}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      print('catched error >> ${e.toString()}');
      return DataFailed(e);
    }
  }
}
