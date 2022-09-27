import 'package:flutter/foundation.dart';

import '../../api/indigo_api.dart';
import '../../models/product_model.dart';

class HomePageProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isGrid = true;
  List<ProductModel> products = [];

  HomePageProvider() {
    getData();
  }

  void getData() async {
    products = await IndigoAPI().products.getProductsData();
    notifyListeners();
  }

  void onChange() {
    isGrid = !isGrid;
    notifyListeners();
  }
}
