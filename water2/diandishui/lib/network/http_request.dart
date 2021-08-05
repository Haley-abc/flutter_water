import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {
  // 1、创建DIO实例
  static BaseOptions baseOptions =
  BaseOptions(baseUrl: BASE_URL, connectTimeout: TIMEOUT);
  static final dio = Dio(baseOptions);

  // 2、发送76  网络请求
  static Future request(String url,
      {String method = 'get', Map<String,
          dynamic> params,
      dynamic data}) async {
    Options options = Options(method: method);

    try {
      final result = await dio.request(url,
          queryParameters: params, options: options, data: data);
      return result;
    } on DioError catch (err) {
      print("err:$err");
      throw err;
    }
  }

  // 3、封装下载
  void upLoad() {}
}
