import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            Container(
              height: Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/image/logo1.png"
                  ),
                ),
              ),
            ),
            //Xin chèo
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Xin chào",
                    style: TextStyle(
                      fontSize: Dimensions.font20*3+Dimensions.font20/2,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Đăng nhập vào tài khoản của bạn",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      //fontWeight: FontWeight.bold,
                      color: Colors.grey[500]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            // Email
            AppTextField(
              hintText: "Email",
              icon: Icons.email,
              textController: emailController),
            SizedBox(height: Dimensions.height20,),
            //MK
            AppTextField(
              hintText: "Mật khẩu",
              icon: Icons.password_sharp,
              textController: passwordController),
            SizedBox(height: Dimensions.height20,),
            
        
            
            SizedBox(height: Dimensions.height20,),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                text: TextSpan(
                  text: "Đăng nhập vào tài khoản của bạn",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                  )
                  ),
                ),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // Nút đăng nhập
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor
              ),
              child: Center(
                child: BigText(
                  text: "Đăng nhập",
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // Tạo tài khoản
            RichText(
              text: TextSpan(
                text: "Không có tài khoản?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                  text: " Tạo tài khoản",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                  ),)
                ]
              ),
              
            ),
            
          ],
        ),
      ),
    );
  }
}