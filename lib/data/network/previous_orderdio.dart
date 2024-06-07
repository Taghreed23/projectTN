import 'package:dio/dio.dart';
import 'package:food_saver/data/models/pastOrderModel.dart';


class PreviousOrderRequest {
  final Dio dio;

  PreviousOrderRequest(this.dio);

  Future<List<PreviousOrdersModel>> getPastOrdersData() async {
    try {
  var headers = {
  'Authorization': 'Token ea14ef561d160843f22f97621dd1e6995e72f1c0'
};
var response = await dio.request(
  'https://mnnt.shop/api/client_past_order/',
  options: Options(
    method: 'GET',
    headers: headers,
  ),
);

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> pastOrders = jsonData['items'];

      List<PreviousOrdersModel> pastOrdersList = [];

      for (var pastOrder in pastOrders) {
        PreviousOrdersModel pastOrderModel = PreviousOrdersModel(
          image: pastOrder['product_image'],
          name: pastOrder['product_name'],
          product_description: pastOrder['product_description'],
          date: pastOrder['product_expire_time_humified'],
          shop_name: pastOrder['product_shop_name'],
          price: pastOrder['product_price']
        );
        pastOrdersList.add(pastOrderModel);
      }

      return pastOrdersList;
    } catch (e) {
      return [];
    }
  }
}