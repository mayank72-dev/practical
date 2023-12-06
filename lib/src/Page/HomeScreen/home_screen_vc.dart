
import 'package:flutter/material.dart';
import 'package:practical/src/Apiservice/apiService.dart';
import 'package:practical/src/Model/oderhistory.dart';
import 'package:practical/src/Utils/Notifier/home_notifier.dart';
import 'package:provider/provider.dart';


HomeScreen({ String? authToken,String?  userId}) => ChangeNotifierProvider<HomeNotifier>(create: (_) => HomeNotifier(), child: Builder(builder: (context) =>HomeProviderScreen(authToken:authToken,userId:userId,context:context)),);
class HomeProviderScreen extends StatelessWidget {
  String? authToken;
  String? userId;
   HomeProviderScreen({Key? key,required BuildContext context,required this.userId,required this.authToken}) : super(key: key){
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       var state = Provider.of<HomeNotifier>(context, listen: false);
       state.initState(authToken,userId);
     });
   }


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context,state, child) => Scaffold(
      appBar: AppBar(title: Text("HomeScreen")),
      body: Center(child: Container(
          height: 500,
          child: FutureBuilder<List<OrderHistory>>(
            future: ApiService().getorder(authToken, userId),
            builder: (context,snapshot){
              if(snapshot.hasData){
    return ListView.builder( itemCount: snapshot.data!.length,
    itemBuilder: (context, index){
    return Column(
    children: [
    Container(
    height: MediaQuery.of(context).size.height*1,
    width: MediaQuery.of(context).size.height*1,
    child: ListView.builder(
    itemCount: snapshot.data![index].data!.length,
    itemBuilder:(context,position){
    return Text(snapshot.data![index].data![position].orderID!);

    }),

    )
    ],
    );


    });
    }else{
       return Text("")     ;

    }})))));
  }
}
