

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical/src/Controller/customButton.dart';
import 'package:practical/src/Controller/customtextfield.dart';
import 'package:practical/src/Utils/Notifier/login_notifier.dart';
import 'package:provider/provider.dart';

import '../../Constant/app_string.dart';
import '../../Element/trxtfield.dart';
import '../../Validation/validation.dart';
LoginScreen() => ChangeNotifierProvider<LoginNotifier>(create: (_) => LoginNotifier(), child: Builder(builder: (context) =>LoginProviderScreen(context:context)),);
class LoginProviderScreen extends StatelessWidget {
  const LoginProviderScreen({Key? key,required BuildContext context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context,state, child) =>Scaffold(
      body: Center(
        child: Form(
          key: state.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(AppString.login),
                Padding(padding:EdgeInsets.only(top: ScreenUtil().setHeight(15))),
                Text(AppString.enterLogin),
                customTextField(double.infinity, email, (value) => emailValidation(value), state.focusNode[0] ,  AppString.email,),
                customTextField(double.infinity, password, (value) => passwordValidation(value), state.focusNode[1] , AppString.password,),
                Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(35))),
                customButton( (){ state.Checkvalidation(context);}, Colors.green, AppString.login,),

              ],

            ),
          ),
        ),
      ),
    ));
  }
}
