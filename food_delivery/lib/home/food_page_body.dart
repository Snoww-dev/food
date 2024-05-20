import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super (key : key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}
class _FoodPageBodyState extends State<FoodPageBody>{
  PageController pageController =PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor = 0.8;

  //Sử dụng PageController để theo dõi và phản ứng lại với sự thay đổi của trang
  // Khi thay đổi trang,phương thức listener sẽ được gọi, giá trị của trang hiện tại sẽ được cập nhật vào _currPageValue và UI sẽ được làm mới thông qua setState
  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue = pageController.page!;
        //print ("Current value is "+ _currPageValue.toString());
      });
    });
  }

  //Dọn dẹp dữ liệu khi widget không còn cần thiết nữa.
  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Container(
        // color: Colors.redAccent,
        height: 320,
        child: PageView.builder(
          controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
          return _buildPageItem(position);
        }),
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();   //Biến đổi ma trận 4x4
    if(index ==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);   //currScale được tính toán để xác định tỷ lệ của trang, tạo hiệu ứng thu nhỏ hoặc phóng to
    }

    return  Stack(  // Ngăn xếp
      children: [
          Container(
            height : 220,
            margin:  EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration( // Bán kính đường viền
              borderRadius: BorderRadius.circular(30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                fit : BoxFit.cover,
                image: AssetImage(
                  "assets/image/thucan1.jpg"
                )
              )
          ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child : Container(
              height : 120,
              margin:  EdgeInsets.only(left: 30, right: 30, bottom: 15),
              decoration: BoxDecoration( // Bán kính đường viền
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15,left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigTest(text: "Chinese Side"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {return Icon(Icons.star, color:AppColors.mainColor,size: 15,);}),
                      ),
                      SizedBox(width: 10,),
                      SmallTest(text: "4.5"),
                      SizedBox(width: 10,),
                      SmallTest(text: "1287 "),
                      SizedBox(width: 10,),
                      SmallTest(text: "comments ")
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.inconColor1),
                      
                      IconAndTextWidget(icon: Icons.location_on,
                        text: "1.7km",
                        iconColor: AppColors.mainColor),
                      
                      IconAndTextWidget(icon: Icons.access_time_rounded,
                        text: "32min",
                        iconColor: AppColors.inconColor2)
                    ],
                  )
                ],
              ),
            ),
          ),
          )
      ],
    );
  }
}

