import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
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
  double  _height = Dimensions.pageViewContainer;
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
    return Column(
      children: [
      //Slider section
      Container(
        // color: Colors.redAccent,
        height: Dimensions.pageView,
        child: PageView.builder(
          controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
          return _buildPageItem(position);
        }),
      ),
      //Dots
      new DotsIndicator(
        dotsCount: 5,
        position: _currPageValue.floor(),
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      //Popular text
      SizedBox(height: Dimensions.height30,),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(text: "Popular"),
            SizedBox(width: Dimensions.width10,),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: BigText(text: ".",color: Colors.black26,),
            ),
            SizedBox(width: Dimensions.width10,),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: SmallText(text: "Food pairing",),
            ),
            ],),
      ),
      //List of food and images
      Container(
        height: 900,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          //shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white38,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/image/thucan1.jpg"
                      )
                    )
                  ),
                )
              ],
            ),
          );
      }),
      )
    ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();   //Biến đổi ma trận 4x4, biến đổi kích thước và vị trí
    if(index ==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);   //currScale được tính toán để xác định tỷ lệ của trang, tạo hiệu ứng thu nhỏ hoặc phóng to
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans,0);

    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans,0);

    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans,0);

    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2,1);

    }

    return  Transform(
      transform: matrix,
      child : Stack(  // Ngăn xếp
      children: [
          Container(
            height : Dimensions.pageViewContainer,
            margin:  EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration( // Bán kính đường viền
              borderRadius: BorderRadius.circular(Dimensions.radius30),
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
              height : Dimensions.pageViewTextContainer,
              margin:  EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration( // Bán kính đường viền
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                // Xử lý bóng
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0)
                  )
                ]

            ),
            child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 15,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10),
                        SmallText(text: "1287"),
                        SizedBox(width: 10),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: AppColors.iconColor2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
          ),
      ],
    ),
    );
  }
}
