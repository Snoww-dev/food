import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity =0;
  int get quantity => _quantity;

  Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      print("got products");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded=true;
      update();
    }else{

    }
  }

  // Cho phép Thêm, Giảm Sản phẩm
  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity=checkQuantity(_quantity+1);
    }else{
      _quantity=checkQuantity(_quantity-1);
    }
    update();
  }
  // Kiểm tra sl SP để ko đc nhỏ hơn 0 và lớn hơn 20
  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Số lượng sản phẩm", "Bạn không thể giảm thêm !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    }else if(quantity>20){
      Get.snackbar("Số lượng sản phẩm", "Bạn không thể tăng thêm !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
  }
  //Khi thay đổi sl 1 sp, thì các sp còn lại ko bị thay đổi
  void initProduct(){
    _quantity=0;
  }
}