import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child:BigText(size: Dimensions.font26,text: "Cánh gà chiên xù"),),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yelowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/thucan1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text :"Cánh gà rán là món ăn phổ biến trong các bữa tiệc và các buổi tụ họp gia đình. Cánh gà sau khi được tẩm ướp kỹ lưỡng sẽ được lăn qua bột và chiên giòn. Với lớp da giòn tan bên ngoài và phần thịt mềm bên trong, cánh gà rán là món ăn yêu thích của nhiều người, thường được ăn kèm với các loại sốt như sốt BBQ, sốt phô mai, hay sốt chua ngọt."),
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,),
                BigText(text: "\12.88 " + " X " + " 0 ", color : AppColors.mainBlackColor, size: Dimensions.font26,),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,),
            ],)
          ),
          Container(
            height: Dimensions.bottomHeightBar,  // Có vấn đề về kích thước ( co the de la 120)
            padding: EdgeInsets.only(top:Dimensions.height30, bottom: Dimensions.height30,  left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20*2),
                topRight: Radius.circular(Dimensions.radius20*2)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color : Colors.white
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                  child: BigText(text: "\$10 | Thêm vào giỏ hàng", color: Colors.white),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}