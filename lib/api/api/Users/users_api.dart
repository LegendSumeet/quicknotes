import 'package:QuickNotes/api/api/config/serveConfig.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_api.g.dart';

enum UserApiAction { login, register }

@Riverpod(keepAlive: true)
class UsersApiPoint extends _$UsersApiPoint {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiServeConfig.serveUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
  @override
  Future<Response> build() async {
    return Response(requestOptions: RequestOptions(path: ''));
  }

  Future<Response> execute(UserApiAction action,
      {required Map<String, dynamic> data, String? email}) async {
    late Response response;

    try {
      switch (action) {
        case UserApiAction.login:
          response =
              await _dio.get('/login', queryParameters: {'email': email});
          break;
        case UserApiAction.register:
          response = await _dio.post('/register', data: data);
          break;
      }
    } on DioException catch (e) {
      print('Dio error: $e');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }

    return response;
  }
}
