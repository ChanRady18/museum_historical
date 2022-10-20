import 'package:flutter/material.dart';

import '../model/data_model.dart';
import '../repo/get_data_repo.dart';

class DataProvider with ChangeNotifier{

  List<DataModel> dataList = [];
  List<BannerModel> bannerList = [];


  Future<dynamic> getDataList() async{
    var data = listDataRepo();
    dataList = await data;
    notifyListeners();
  }

  getBannerList(){
    var b = getBannerRepo();
    bannerList = b;
    notifyListeners();
  }



}