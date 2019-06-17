import 'package:flutter/material.dart';

class Users with ChangeNotifier{
  List<Map<String, dynamic>> datas = [];

  void addData({Map<String, dynamic> data, bool notify: true}){
    if (data == null){
      datas.add({});
    }else{
      datas.add(data);
    }
  
    if (notify){
      // if notify, call notifyListeners for rebuild the ui due to data changes
      notifyListeners();
    }
    // print("$datas");
  }

  void changeData(int idx, Map<String, dynamic> data, {bool notify: true}){
    datas[idx] = data;
    if (notify){
      // if notify, call notifyListeners for rebuild the ui due to data changes
      notifyListeners();
    }
    // print("$datas");
  }

  void removeData(int idx){
    datas.removeAt(idx);
    // call notifyListeners for rebuild the ui due to data changes
    notifyListeners();
  }
}

class CoreTitle with ChangeNotifier{
  String title = "Master Title";
}