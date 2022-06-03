class ApiConstants {
  ApiConstants._();

  static Map<String, String> header([String? token]) {
    final _map = {
      "Accept": "application/json",
    };

    if (token != null) _map.putIfAbsent('Authorization', () => 'Bearer $token');
    return _map;
  }

  static const String baseUrl = 'http://202.141.242.82/CustomerWebServices';
  static const String login = '$baseUrl/api/values/UserAuthentication';
  static const String signUp = '$baseUrl/auth/register';
  static const String addClientApi = '$baseUrl/client/create';
  static const String listClientApi = '$baseUrl/client/list';
  static const String detailClientApi = '$baseUrl/client/get/';
  static const String addCategoryApi = '$baseUrl/category/create';
  static const String listCategoryApi = '$baseUrl/category/list';
  static const String allProductsApi = '$baseUrl/product/list';
  static const String productDetailApi = '$baseUrl/product/get/';
  static const String policyList = '$baseUrl/policy/list';
  static const String addToCart = '$baseUrl/cart/create';
  static const String cartItems = '$baseUrl/cart/get';
  static const String changeQuantity = '$baseUrl/cart/edit';
  static const String deleteCartItem = '$baseUrl/cart/delete';
  static const String orderCreate = '$baseUrl/order/create';
  static const String allOrderList = '$baseUrl/order/list';
  static const String orderDetail = '$baseUrl/order/get/';
  static const String statusChange = '$baseUrl/order/edit';
  static const String user = '$baseUrl/auth/get-user/';
  static const String dashboard = '$baseUrl/order/get-dashboard-stats';
  static const String updateOrder = '$baseUrl/order/edit-with-product';
  static const String addOrderProduct = '$baseUrl/order/add-product';
  static const String deleteOrderProduct = '$baseUrl/order/delete-product';
}
