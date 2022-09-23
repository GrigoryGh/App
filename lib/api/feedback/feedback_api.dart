import '../../models/feedback_model.dart';
import 'package:dio/dio.dart';

class FeedbackApi {
  final Dio appDioClient;

  FeedbackApi(
    this.appDioClient,
  );

  Future<List<Questions>> getQuestions() async {
    List<Questions> questions = [];

    final json = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/feedback',
    );

    var res = json.data as Map<String, dynamic>;

    questions = res.values.first
        .map<Questions>(
          (e) => Questions.fromJson(e as Map<String, dynamic>),
        )
        .toList();
    return questions;
  }
}
