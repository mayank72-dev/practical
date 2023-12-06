import 'package:flutter/cupertino.dart';

import '../../Apiservice/apiService.dart';
import '../../Model/oderhistory.dart';

class HomeNotifier extends ChangeNotifier {


  List<OrderHistory>  historyData = [];
  void updateDataModel(List<OrderHistory> historydata){
    this.historyData = historydata.cast<OrderHistory>();
    notifyListeners();
  }

  initState(authToken,userId)async{

    List<OrderHistory> data = await ApiService().getorder(authToken,userId);

    updateDataModel(data);
    print("History List$data");
    print("History length${historyData.length}");





  }
}