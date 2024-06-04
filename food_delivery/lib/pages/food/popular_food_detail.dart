import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/thucan1.jpg"
                  ) )
              ),
            )),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )),
          // introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top : Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppColumn(text: "Chinese Side",),
                SizedBox(height: Dimensions.height20,),
                BigText(text: "Introduce"),
                SizedBox(height: Dimensions.height20,),
                Expanded(child:SingleChildScrollView(child:  ExpandableTextWidget(text: "Một tô bún bò chuẩn vị Huế sẽ gồm sợi bún, thịt bò, tiết heo, chả cua và nước dùng. Nguyên liệu làm bún là bột gạo pha với bột lọc theo tỷ lệ chuẩn để sợi bún có độ dai vừa phải. Thịt bò được chọn là phần bắp chân trước, nạm bò hoặc bắp hoa màu đỏ tươi, mỡ bò màu vàng nhạt. Chả cua màu vàng cam bắt mắt được làm từ gạch và thịt cua xay nhuyễn với vị béo, bùi tự nhiên.“Linh hồn” của món bún bò xứ Huế chính là nước dùng. Nước dùng được ninh từ xương ống bò nên có vị ngọt đậm đà. Ngoài ra, người ta còn thêm vào nước dùng chút mắm ruốc và sả để dậy mùi thơm nồng hấp dẫn.Một tô bún bò Huế ngon, chuẩn vị đất cố đô phải có hương thơm hấp dẫn. Tô bún có sắc cam của dầu điều, sắc nâu của thịt bò, tiết lợn và sắc xanh của hành, mùi, thêm chút giá đỗ thanh mát. Món bún với đủ vị cay, ngọt, bùi đã thực sự làm “xiêu lòng” thực khách.Điểm tạo nên sự khác biệt của bún bò Huế chính là sợi bún to, lát thịt bò mỏng mà to bản, nước lèo có màu đỏ cam với vị cay nồng hấp dẫn. Để nấu món đặc sản đất Huế này, người đứng bếp cần thực sự tỉ mỉ từ khâu chọn nguyên liệu tới các bước chế biến."))),
              ],
            ),
          )),
        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
            )
          ],
        ),
      ),
    );
  }
}