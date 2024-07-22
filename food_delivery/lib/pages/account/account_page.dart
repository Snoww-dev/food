import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Hồ sơ", size: 24, color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            // Icon hồ sơ
            AppIcon(icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height30,),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                        //Tên
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Tên Tớ",)),
                    SizedBox(height: Dimensions.height20,),
                    //Sđt
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.phone,
                        backgroundColor: Color.fromARGB(255, 240, 196, 36),
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "013131234",)),
                    SizedBox(height: Dimensions.height20,),
                    //Email
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.yelowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "email@gmail.com",)),
                    SizedBox(height: Dimensions.height20,),
                    //Địa chỉ
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.location_on,
                        backgroundColor: Color.fromARGB(255, 5, 116, 207),
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Huflit, Hóc Môn, Hồ Chí Minh",)),
                    SizedBox(height: Dimensions.height20,),
                    //Tin nhắn
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.pink,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Tên Tớ",)),
                    SizedBox(height: Dimensions.height20,),
                    // Đăng xuất
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.pink,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Tên Tớ",)),
                    SizedBox(height: Dimensions.height20,),
                  ],
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}