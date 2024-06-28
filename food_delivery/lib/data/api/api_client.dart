import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

//Định nghĩa một client API cơ bản với các thiết lập header và xử lý yêu cầu GET,
//có khả năng bắt và xử lý lỗi nếu có sự cố xảy ra khi gửi yêu cầu.
class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    token = AppConstants.TOKEN; // Gán giá trị mặc định cho token
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }


  Future<Response> getData(String uri,) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
