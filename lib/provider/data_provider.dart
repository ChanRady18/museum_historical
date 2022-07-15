import 'package:flutter/cupertino.dart';
import 'package:museum_test_api/repo/data_repo.dart';

import '../model/data_model.dart';

class DataProvider with ChangeNotifier{
  List<DataModel> dataList = [];
  List<BannerModel> bannerList =[];

  Future<dynamic> getDataList() async{
    var d = await listDataRepo();
    dataList = d;
    notifyListeners();
  }

  getBannerList(){
    var b = getBannerRepo();
    bannerList = b;
    notifyListeners();
  }


}