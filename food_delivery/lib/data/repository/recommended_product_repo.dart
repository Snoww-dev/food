import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

//định nghĩa một repository tên là PopularProductRepo sử dụng ApiClient để lấy dữ liệu từ một API cụ thể.
//Repository này chịu trách nhiệm lấy danh sách sản phẩm phổ biến từ một URL được cung cấp.
//Việc sử dụng GetxService cho phép quản lý vòng đời của PopularProductRepo một cách dễ dàng.
class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}