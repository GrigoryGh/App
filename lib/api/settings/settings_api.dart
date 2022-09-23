import 'package:dio/dio.dart';
import 'package:indigo/models/product_model.dart';
import 'package:indigo/models/settings_model.dart';

class SettingsApi {
  final Dio appDioClient;

  SettingsApi(
    this.appDioClient,
  );

  Future<List<Settings>> getSettingsData() async {
    List<Settings> settings = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/settings',
    );

    if (result.data is List) {
      List<dynamic> settingsData = result.data;

      settings = settingsData
          .map<Settings>(
            (e) => Settings.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    return settings;
  }
}
