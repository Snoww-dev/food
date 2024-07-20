class AppConstants {
  static const String APP_NAME = 'DBFood';
  static const int APP_VERSION = 1;

  // Địa chỉ URL cục bộ của Laravel
  static const String BASE_URL = 'http://10.0.2.2:8000';

  // Các đường link API của Laravel
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URI = '/api/v1/products/recommended';
  static const String CART_URI = "/api/v1/products/recommended";

  // Đường dẫn đến thư mục uploads trong Laravel
  static const String UPLOAD_URL = '/uploads/';

  //user and auth end points
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";
}
