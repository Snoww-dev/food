import 'package:food_delivery/data/repository/user_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel =>_userModel;

  Future<ResponseModel> getUserInfo() async {
    
    Response response = await userRepo.getUserInfo();
    //print(response.statusCode.toString());
    print(response.body.toString());
    print("Response Status Code: ${response.statusCode}");
    print("Response Status Text: ${response.statusText}");
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Thành công");
    }else{
      print("did not get");
      responseModel = ResponseModel(false, response.statusText!);
    }
    
    //_isLoading = false;
    update();
    return responseModel;
  }
}