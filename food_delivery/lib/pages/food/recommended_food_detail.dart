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
                child: Center(child:BigText(size: Dimensions.font26,text: "Chinese Side"),),
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
                  child: ExpandableTextWidget(text :"Một tô bún bò chuẩn vị Huế sẽ gồm sợi bún, thịt bò, tiết heo, chả cua và nước dùng. Nguyên liệu làm bún là bột gạo pha với bột lọc theo tỷ lệ chuẩn để sợi bún có độ dai vừa phải. Thịt bò được chọn là phần bắp chân trước, nạm bò hoặc bắp hoa màu đỏ tươi, mỡ bò màu vàng nhạt. Chả cua màu vàng cam bắt mắt được làm từ gạch và thịt cua xay nhuyễn với vị béo, bùi tự nhiên.“Linh hồn” của món bún bò xứ Huế chính là nước dùng. Nước dùng được ninh từ xương ống bò nên có vị ngọt đậm đà. Ngoài ra, người ta còn thêm vào nước dùng chút mắm ruốc và sả để dậy mùi thơm nồng hấp dẫn.Một tô bún bò Huế ngon, chuẩn vị đất cố đô phải có hương thơm hấp dẫn. Tô bún có sắc cam của dầu điều, sắc nâu của thịt bò, tiết lợn và sắc xanh của hành, mùi, thêm chút giá đỗ thanh mát. Món bún với đủ vị cay, ngọt, bùi đã thực sự làm “xiêu lòng” thực khách.Điểm tạo nên sự khác biệt của bún bò Huế chính là sợi bún to, lát thịt bò mỏng mà to bản, nước lèo có màu đỏ cam với vị cay nồng hấp dẫn. Để nấu món đặc sản đất Huế này, người đứng bếp cần thực sự tỉ mỉ từ khâu chọn nguyên liệu tới các bước chế biến.Bún bò Huế là một trong những đặc sản của tỉnh Thừa Thiên Huế, mặc dù món bún này phổ biến trên cả ba miền ở Việt Nam và cả người Việt tại hải ngoại. Tại Thừa Thiên Huế, món này được gọi đơn giản là bún bò hoặc gọi cụ thể hơn là bún bò thịt bò. Các địa phương khác gọi là bún bò Huế để chỉ xuất xứ của món ăn này. Bún bò chính gốc Huế có nguyên liệu chính là bún, thịt bắp bò, giò heo, cùng nước dùng có màu đỏ đặc trưng do ớt và vị sả và ruốc."),
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
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,),
            ],)
          )
        ],
      ),
    );
  }
}