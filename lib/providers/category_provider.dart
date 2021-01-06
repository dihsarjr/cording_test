import 'package:coding_app/models/category_model.dart';
import 'package:coding_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class CategoryProvider with ChangeNotifier {
  CategoryModel categoryModel = CategoryModel();
  bool done = false;

  /// get category
  Future<CategoryModel> getCategory() async {
    done = false;
    final url = "http://64.202.189.139/restaurent_test/public/api/categories";
    try {
      Response response = await get(url);

      if (response.statusCode == 200) {
        categoryModel = categoryModelFromJson(response.body);

        print(categoryModel.message);
        notifyListeners();
        done = true;
        return categoryModel;
      } else {
        print("server error ${response.statusCode}");
        done = false;
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return categoryModel;
  }

  /// get category products

  ProductModel productModel = ProductModel();
  Future<ProductModel> getCategoryProducts({int id}) async {
    final url =
        "http://64.202.189.139/restaurent_test/public/api/foods/categories?with=restaurant;category;extras;extraGroups;foodReviews&search=restaurant_id:13&searchFields=restaurant_id:=&categories[]=$id&limit=3&offset=2";
    try {
      Response response = await get(url);
      if (response.statusCode == 200) {
        productModel = productModelFromJson(response.body);
        print(response.body);
        notifyListeners();
      } else {
        print("${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return productModel;
  }
}
