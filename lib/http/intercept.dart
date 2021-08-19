import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  //TODO: Retornando mais detalhes sobre o envio do http
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // print('Request');
    // print('Url: ${data.toHttpRequest()}');
    // print('Headers: ${data.headers}');
    // print('Body: ${data.body}');
    return data;
  }

  @override
  //TODO: Retornando mais detalhes sobre o recebimento do http
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
     // print('Response');
     // print('Headers: ${data.headers}');
     // print('Status code: ${data.statusCode}');
     // print('Body: ${data.body}');
    return data;
  }
}