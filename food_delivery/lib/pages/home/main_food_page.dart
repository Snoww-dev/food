import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    // Vẽ phần đầu trang
    return RefreshIndicator(child: Column(
        children: [
          Container(
              child: Container (
                margin: EdgeInsets.only(top : Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "YumHub", color: AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(text: "      Thành Phố", color: Colors.black45),
                            Icon(Icons.arrow_drop_down_rounded)
                        ],)
                      ],
                    ),
                    Center(
                      child : Container(
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        // Icon tìm kiếm  //
                        child: Icon(Icons.search, color: Colors.white, size : Dimensions.iconSize24),
                        // Ô tìm kiếm
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      )
                    ),
                  ],),
                )   ,
            ),
            Expanded(child: SingleChildScrollView(
              child: FoodPageBody(),  //Liên kết với file FoodPageBody   // Vẽ phần body
            ),),
        ],
      ),
      onRefresh: _loadResource);
  }
}