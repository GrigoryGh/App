import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indigo/models/feedback_model.dart';

import '../../api/indigo_api.dart';

class FeedBackProvider extends ChangeNotifier {
  List<Questions> questions = [];
  int currentQuestionIndex = 0;
  bool showLoading = false;

  FeedBackProvider() {
    getData();
  }

  void onChange(int val) {
    currentQuestionIndex = val;
    notifyListeners();
  }

  void getData({bool initial = true}) async {
    showLoading = true;
    if (!initial) notifyListeners();
    questions = await IndigoAPI().feedback.getQuestions();

    if (questions.isEmpty) {
    } else {
      showLoading = false;
    }
    notifyListeners();
  }
}
