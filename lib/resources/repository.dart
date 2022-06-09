import 'package:aag_e_order_app/models/api_responses/add_category_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/add_client_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/add_order_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/add_to_cart_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_category_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_client_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_order_list_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/client_detail_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/dashboard_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/delete_cart_item_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/delete_order_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/get_user_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/order_create_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/order_detail_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/product_detail_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/sign_in_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/sign_up_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_cart_item_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_order_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_order_status_api_response.dart';
import 'package:aag_e_order_app/resources/api_providers/add_to_cart_api.dart';
import 'package:aag_e_order_app/resources/api_providers/all_category_api.dart';
import 'package:aag_e_order_app/resources/api_providers/all_client_api.dart';
import 'package:aag_e_order_app/resources/api_providers/dashboard_get_api.dart';
import 'package:aag_e_order_app/resources/api_providers/order_api.dart';
import 'package:aag_e_order_app/resources/api_providers/policy_api.dart';
import 'package:aag_e_order_app/resources/api_providers/product_api.dart';
import 'package:aag_e_order_app/resources/api_providers/sign_in_post_api.dart';
import 'package:aag_e_order_app/resources/api_providers/sign_up_post_api.dart';
import 'package:aag_e_order_app/resources/api_providers/user_get_api.dart';

class Repository {
  Future<SignUpApiResponse> signUp(Map data) {
    final signUpPost = SignUpPostApi();
    return signUpPost.signUpRequest(data);
  }

  Future<SignInApiResponse> signIn(Map data) {
    final signInPost = SignInPostApi();
    return signInPost.signInRequest(data);
  }

  // Future<AddClientApiResponse> addClientRequest(Map data) async {
  //   return AllClientApi().addClientRequest(data);
  // }

  Future<AllClientApiResponse> allClientRequest(Map data) async {
    return AllClientApi().allClient(data);
  }

  // Future<ClientDetailApiResponse> clientDetailRequest(id) async {
  //   return AllClientApi().detailClientRequest(id);
  // }

  // Future<AllClientApiResponse> searchClient(name) async {
  //   return AllClientApi().searchClient(name);
  // }

  Future<AddCategoryApiResponse> addCategoryRequest(Map data) async {
    return AllCategoryApi().addCategoryRequest(data);
  }

  Future<AllCategoryApiResponse> allCategory() async {
    return AllCategoryApi().allCategory();
  }

  Future<AllCategoryApiResponse> searchCategory(name) async {
    return AllCategoryApi().searchCategory(name);
  }

  Future<AllProductApiResponse> allProduct(Map data) async {
    return ProductApi().allProducts(data);
  }

  // Future<ProductDetailApiResponse> productDetail(Map data) async {
  //   return ProductApi().productDetailRequest(data);
  // }

  Future<AllPolicyApiResponse> allPolicy(Map data) async {
    return PolicyApi().allPolicy(data);
  }

  Future<AddToCartApiResponse> addToCart(Map data) async {
    return AddToCartApi().addToCart(data);
  }

  Future<CartItemsApiResponse> cartItems(Map data) async {
    return AddToCartApi().getCartItems(data);
  }

  Future<UpdateCartItemApiResponse> updateCartItems(Map data) async {
    return AddToCartApi().updateCartItems(data);
  }

  Future<DeleteCartItemApiResponse> deleteCartItem(Map data) async {
    return AddToCartApi().deleteCartItems(data);
  }

  Future<OrderCreateApiResponse> orderCreate(Map data) async {
    return OrderApi().placeOrder(data);
  }

  Future<AddOrderProductApiResponse> addOrderProduct(Map data) async {
    return OrderApi().addOrderProduct(data);
  }

  Future<DeleteOrderProductApiResponse> deleteOrderProduct(Map data) async {
    return OrderApi().deleteOrderProduct(data);
  }

  Future<AllOrderListApiResponse> allOrder(Map data) async {
    return OrderApi().allOrder(data);
  }

  Future<AllOrderListApiResponse> searchOrder(Map data) async {
    return OrderApi().searchOrder(data);
  }

  Future<OrderDetailApiResponse> orderDetail(id) async {
    return OrderApi().orderDetail(id);
  }

  Future<UpdateOrderStatusApiResponse> orderStatus(Map data) async {
    return OrderApi().orderStatusChange(data);
  }

  Future<UpdateOrderApiResponse> updateOrder(Map data) async {
    return OrderApi().updateOrder(data);
  }

  Future<GetUserApiResponse> getUser(Map data) async {
    return UserGetApi().getUser(data);
  }

  Future<DashboardApiResponse> dashboardData(Map data) async {
    return DashboardGetApi().getDashboardData(data);
  }

  // Future<AllProductApiResponse> searchProduct(id, name) async {
  //   return ProductApi().searchProducts(id, name);
  // }
}
