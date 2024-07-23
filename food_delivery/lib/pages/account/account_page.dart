import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/routes/routes_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      //print("Người dùng đã đăng nhập");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Hồ sơ", size: 24, color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?(userController.isLoading?Container(
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
            //Tên
            AccountWidget(
              appIcon: AppIcon(icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,),
              bigText: BigText(text:userController.userModel.name,)),
            SizedBox(height: Dimensions.height20,),
            //Sđt
            AccountWidget(
              appIcon: AppIcon(icon: Icons.phone,
                backgroundColor: Color.fromARGB(255, 240, 196, 36),
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,),
              bigText: BigText(text:userController.userModel.phone,)),
            SizedBox(height: Dimensions.height20,),
            //Email
            AccountWidget(
              appIcon: AppIcon(icon: Icons.email,
                backgroundColor: AppColors.yelowColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,),
              bigText: BigText(text:userController.userModel.email,)),
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
              bigText: BigText(text: "Tin nhắn",)),
            SizedBox(height: Dimensions.height20,),
            //Đăng xuất
            GestureDetector(
              onTap: (){
                if(Get.find<AuthController>().userLoggedIn()){
                  Get.find<AuthController>().clearSharedData();
                  Get.find<CartController>().clear();
                  Get.find<CartController>().clearCartHistory();
                  Get.offNamed(RouteHelper.getSignInPage());
                }else{
                  print("Bạn đã đăng xuất");
                }
              },
              child: AccountWidget(
                appIcon: AppIcon(icon: Icons.logout,
                  backgroundColor: Colors.pink,
                  iconColor: Colors.white,
                  iconSize: Dimensions.height10*5/2,
                  size: Dimensions.height10*5,),
                bigText: BigText(text: "Đăng xuất",)),
            ),
            SizedBox(height: Dimensions.height20,),
          
          ],
        ),
        ):CustomLoader()
      ):Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 20,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/image/signin.png"))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20*3,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                                child: BigText(
                              text: "Đăng nhập",
                              color: Colors.white,
                              size: Dimensions.font26,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                );
      })
    );
  }
}