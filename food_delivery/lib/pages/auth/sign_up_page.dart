import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custom_message.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/routes/routes_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.jpg",
      "f.jpg",
      "g.jpg"
    ];
    void _registration(AuthController authController){
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email= emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Nhập tên của bạn", title: "Tên");
      }else if(phone.isEmpty){
        showCustomSnackBar("Nhập số điện thoại của bạn", title: "Số điện thoại");

      }else if(email.isEmpty){
        showCustomSnackBar("Nhập địa chỉ email của bạn", title: "Địa chỉ Email");

      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Nhập địa chỉ email không hợp lệ", title: "Địa chỉ email hợp lệ");

      }else if(password.isEmpty){
        showCustomSnackBar("Nhập mật khẩu của bạn", title: "Mật khẩu");

      }else if(password.length<6){
        showCustomSnackBar("Mật khẩu không thể ít hơn 6 ký tự", title: "Mật khẩu");

      }else{
        
        SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password);
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("Đăng ký thành công");
            Get.offNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder:(_authController){
        return !_authController.isLoading?SingleChildScrollView(
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
            // Email
            AppTextField(
              hintText: "Email",
              icon: Icons.email,
              textController: emailController),
            SizedBox(height: Dimensions.height20,),
            //MK
            AppTextField(
              hintText: "Mật khẩu",
              icon: Icons.password_sharp, isObscure: true,
              textController: passwordController),
            SizedBox(height: Dimensions.height20,),
            //Ten
            AppTextField(
              hintText: "Tên",
              icon: Icons.person,
              textController: nameController),
            SizedBox(height: Dimensions.height20,),
            //Sdt
            AppTextField(
              hintText: "Sđt",
              icon: Icons.phone,
              textController: phoneController),
            SizedBox(height: Dimensions.height20,),
        
            GestureDetector(
              onTap: (){
                _registration(_authController);
              },
              child: Container(
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHeight/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor
                ),
                child: Center(
                  child: BigText(
                    text: "Đăng ký",
                    size: Dimensions.font20+Dimensions.font20/2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10,),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: "Có tài khoản rồi?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20
                )
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // Sign up options
            RichText(
              text: TextSpan(
                text: "Đăng ký bằng một trong các phương pháp sau",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font16
                )
              ),
            ),
            Wrap(
              children: List.generate(3, (index)=> Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: Dimensions.radius30,
                  backgroundImage: AssetImage(
                    "assets/image/"+signUpImages[index]
                  ),
                ),
              ))
            )
          ],
        ),
      ):const CustomLoader();
      })
    );

    
  }
}