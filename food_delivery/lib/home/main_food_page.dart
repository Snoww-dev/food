import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // Vẽ phần đầu trang
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Container (
                margin: EdgeInsets.only(top : 45, bottom: 15),
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigTest(text: "YumHub", color: AppColors.mainColor),
                        Row(children: [
                          SmallTest(text: "Thành Phố", color: AppColors.mainBlackColor),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],)
                      ],
                    ),
                    Center(
                      child : Container(
                        width: 45,
                        height: 45,
                        // Icon tìm kiếm  //
                        child: Icon(Icons.search, color: Colors.white),
                        // Ô tìm kiếm
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor,
                        ),
                      )
                    ),
                  ],),
                )   ,
            ),
            FoodPageBody(),  //Liên kết với file FoodPageBody
        ],
      ),
    );
  }
}