class Urls{
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
   static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email,String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static String getHomeSlider = '$_baseUrl/ListProductSlider';
  static String getCategoryList = '$_baseUrl/CategoryList';
  static String getProductByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String getProductByRemarks(String remarks) => '$_baseUrl/ListProductByRemark/$remarks';
  static String getProductDetails(int id) => '$_baseUrl/ProductDetailsById/$id';




}