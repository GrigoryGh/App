import 'package:dio/dio.dart';
import 'package:indigo/api/feedback/feedback_api.dart';
import 'package:indigo/api/products/products_api.dart';
import 'package:indigo/api/settings/settings_api.dart';

class IndigoAPI {
  static IndigoAPI? _singleton;

  late ProductsApi products;
  late SettingsApi settings;
  late FeedbackApi feedback;
  Dio appDioClient = Dio();

  factory IndigoAPI() {
    _singleton ??= IndigoAPI._internal();
    return _singleton!;
  }

  IndigoAPI._internal() {
    products = ProductsApi(appDioClient);
    settings = SettingsApi(appDioClient);
    feedback = FeedbackApi(appDioClient);
  }
}
