
import 'dart:convert';

import 'package:http/http.dart'as http;
import '../Model/oderhistory.dart';
class ApiService {
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse("https://portal-qa.ebest-iot.com/VendingAppApi/loginV1"),

           body: {'email': email,
          'password': password,

        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print("Response::${response.statusCode}");
        print("::${response.statusCode}");
        print("Data::${data}");
        final authToken = data['authToken'];
        final userId = data['userId'];
        print("Token${authToken}");
        print("UserId${userId}");
        return {'authToken': authToken, 'userId': userId};
        /*   print("Token::${authToken}");
        print("UserID::${userId}");*/
      } else {
        print("Login faild");
        return null;

      }
    } catch (e) {
      print("Exeption${e}");
      return null;

    }
  }
Future<List<OrderHistory>> getorder( String? authToken, String? userId )async{
    List<OrderHistory>  orderdata= [];
    try {
      var response = await http.post(Uri.parse("https://portal-qa.ebest-iot.com/VendingAppApi/orderHistory"),
        body: {'authToken':authToken,'userId':userId}

      );
      if(response.statusCode == 200){
        print("response.statusCode history::${response.statusCode}");
        var data = (response.body);
        List<dynamic> order = jsonDecode(data)['data'];
        order.forEach((element) {
       OrderHistory order = OrderHistory.fromJson(element);
    orderdata.add(order);
    print("add List order1$order");
        });
        return orderdata;
      }else{
        print("error");
        return[];
      }
    }catch(e){
      print("Exception${e}");
      return orderdata;
    }
  }
}
