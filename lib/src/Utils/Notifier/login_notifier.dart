import 'package:flutter/material.dart';
import 'package:practical/src/Element/trxtfield.dart';
import '../../Apiservice/apiService.dart';
import '../../Page/HomeScreen/home_screen_vc.dart';
class LoginNotifier extends ChangeNotifier {

  var formKey = GlobalKey<FormState>();

  List<FocusNode> focusNode = [FocusNode(), FocusNode()];

  void Checkvalidation(context) async {
    if (formKey.currentState!.validate()) {

        final Logindata = await ApiService().loginUser(email.text, password.text);
      if (Logindata != null) {
        final authToken = Logindata['authToken'].toString();
        final userId = Logindata['userId'].toString();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(authToken: authToken, userId: userId)));
      } else {
        print("invalid data");
        notifyListeners();
      }
    }
  }
}

